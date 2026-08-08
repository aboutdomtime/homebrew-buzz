cask "buzz" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.7"
  sha256 arm:   "9b2186c6843d726e365908054879a24b7d383b85c7ea02e14c474ad5824beff9",
         intel: "e2f6dea5aa2fa3c5bc4fc43ead23afa163b7da59ba4c91996c17f0b99c7d00ba"

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
