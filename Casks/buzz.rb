cask "buzz" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.10"
  sha256 arm:   "785c78794147d0463981bdcb68dbcb9e86193078cbc94884a173e6e9fddc81b6",
         intel: "ccf78bc6ae99f7c21d7cd16737cd0e39799b32dc533cd328f85e9405d8adc7cb"

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
