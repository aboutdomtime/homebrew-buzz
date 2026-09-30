cask "buzz" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.26"
  sha256 arm:   "8130f89c6163eb24a6bff1fd77d4999214221f018f1cb8d0c2d319f160537569",
         intel: "6cedd5935c6baf3387e08212e0b41e292b3b5edb4c401399b8a9d621b792bb9c"

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
