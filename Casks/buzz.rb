cask "buzz" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.23"
  sha256 arm:   "9197dde29a09ade77f56677e07cb4d6a9d7d1a6a157d7212f0a050144059c5b2",
         intel: "dd0abf673a68e1aad59999194208dd7c144f4718742a997cea7d9c27b7bd016c"

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
