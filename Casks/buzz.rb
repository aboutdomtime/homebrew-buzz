cask "buzz" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.28"
  sha256 arm:   "eaed9b1eb06bb90752277ce2f79a1fdac5192fd99c97bc49f03573e7e8135b25",
         intel: "5b1b1779a7345ac7916d47580630d92006f86dcdbbaadbee4e9726d6d9b68cd7"

  url "https://github.com/block/buzz/releases/download/desktop-v#{version}/Buzz_#{version}_#{arch}.dmg"
  name "Buzz"
  desc "Hive mind communication platform"
  homepage "https://github.com/block/buzz"

  livecheck do
    url :url
    strategy :github_latest
    regex(/^desktop-v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on macos: :catalina

  app "Buzz.app"
end
