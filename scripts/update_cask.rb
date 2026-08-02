#!/usr/bin/env ruby
# frozen_string_literal: true

require "digest"
require "json"
require "net/http"
require "open3"
require "pathname"
require "tempfile"
require "uri"

class UpdateError < StandardError; end

ROOT = Pathname.new(__dir__).join("..").expand_path
CONFIG_PATH = ROOT.join(".github", "brew-tap-publisher.json")

def request(uri, token:, redirects: 5, &block)
  raise UpdateError, "too many redirects for #{uri}" if redirects.negative?

  request = Net::HTTP::Get.new(uri)
  request["Accept"] = "application/vnd.github+json"
  request["User-Agent"] = "homebrew-buzz-updater"
  request["Authorization"] = "Bearer #{token}" unless token.empty?

  Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == "https") do |http|
    http.request(request) do |response|
      case response
      when Net::HTTPSuccess
        return block.call(response)
      when Net::HTTPRedirection
        location = response["location"]
        raise UpdateError, "redirect without a location for #{uri}" if location.nil? || location.empty?

        return request(URI(location), token: token, redirects: redirects - 1, &block)
      else
        raise UpdateError, "GET #{uri} failed: #{response.code} #{response.message}"
      end
    end
  end
end

def fetch_json(url, token:)
  request(URI(url), token: token) { |response| JSON.parse(response.body) }
end

def download_sha256(url, token:)
  Tempfile.create("buzz-release") do |file|
    request(URI(url), token: token) do |response|
      response.read_body { |chunk| file.write(chunk) }
    end
    file.flush
    Digest::SHA256.file(file.path).hexdigest
  end
end

def asset_sha256(asset, token:)
  digest = asset["digest"].to_s.delete_prefix("sha256:")
  return digest if digest.match?(/\A[0-9a-f]{64}\z/i)

  download_sha256(asset.fetch("browser_download_url"), token: token)
end

def github_token
  token = ENV["GITHUB_TOKEN"] || ENV["GH_TOKEN"]
  return token unless token.nil? || token.empty?

  stdout, status = Open3.capture2("gh", "auth", "token")
  status.success? ? stdout.strip : ""
rescue Errno::ENOENT
  ""
end

config = JSON.parse(CONFIG_PATH.read)
repo = config.fetch("repo")
token = github_token
release = fetch_json("https://api.github.com/repos/#{repo}/releases/latest", token: token)

tag_match = Regexp.new(config.fetch("tag_regex")).match(release.fetch("tag_name"))
raise UpdateError, "latest tag does not match #{config.fetch('tag_regex')}" unless tag_match

version = tag_match[1]
assets = release.fetch("assets").to_h { |asset| [asset.fetch("name"), asset] }
release_assets = config.fetch("assets").transform_values do |template|
  name = template.gsub("{version}", version)
  assets.fetch(name) { raise UpdateError, "release is missing #{name}" }
end

arm_sha = asset_sha256(release_assets.fetch("arm"), token: token)
intel_sha = asset_sha256(release_assets.fetch("intel"), token: token)
cask_path = ROOT.join("Casks", "#{config.fetch('cask')}.rb")
content = cask_path.read

version_changed = content.sub!(/^  version "[^"]+"$/, %(  version "#{version}"))
sha_changed = content.sub!(
  /^  sha256 arm:\s+"[0-9a-f]+",\n\s+intel: "[0-9a-f]+"$/,
  %(  sha256 arm:   "#{arm_sha}",\n         intel: "#{intel_sha}")
)

raise UpdateError, "could not update version stanza" unless version_changed
raise UpdateError, "could not update sha256 stanza" unless sha_changed

cask_path.write(content)
puts "Updated #{config.fetch('cask')} to #{version}"
