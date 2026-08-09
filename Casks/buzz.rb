cask "buzz" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.8"
  sha256 arm:   "101cf440dc890a35e66b7c248f31ec996aaa061a15eea7f8a30d20a067884eb2",
         intel: "a8a3ba389ff128634130978e55be178c6011de93494e2135f460fac6f6f2c0bf"

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
