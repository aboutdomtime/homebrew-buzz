cask "buzz" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.20"
  sha256 arm:   "0471456eaa7c3a4ab83ed93cc75d14b21eb57032f96bf2cfa49c0f9fa847bde6",
         intel: "bb6c955f1f809aa8dcb166b8ed66f92e98bb9791be4b09ee4f5a094f09723d1e"

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
