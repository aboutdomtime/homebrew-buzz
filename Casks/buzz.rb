cask "buzz" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.14"
  sha256 arm:   "928ab24b32cb921c3a6d252e756c2711d8801b48a8cc998172caf6f70426e1b6",
         intel: "87ae1a3aaa907d801b79f7e9c6f564f8f594280cba51d6c2a7f1d64d82b7aaf8"

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
