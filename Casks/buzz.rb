cask "buzz" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.25"
  sha256 arm:   "2046fb240d944f27811673a03cb45d9c3f04aa12b59bc745d815d54cc0f7fa82",
         intel: "27bd72d8b25e442298203292c5662d45ad7035dbb5ec8601cc123a2c7e61de31"

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
