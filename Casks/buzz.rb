cask "buzz" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.17"
  sha256 arm:   "f40839c6e15cfaefb087f7de0cb085da41d5ab2ea70843730795385fb15c4891",
         intel: "dbfa4423820d4bfc63b31123744567dd5d9ffa2bd02cfd983cea81255e8922cb"

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
