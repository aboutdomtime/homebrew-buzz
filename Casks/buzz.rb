cask "buzz" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.18"
  sha256 arm:   "3fc84fabb61dd108ddb66baef3476edeebbe2d10f5acc2ff575c886979df14f9",
         intel: "21c09a517a3e2c3b7224422ca7fcfca17c4d71321008d9486c1245e0866ce8aa"

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
