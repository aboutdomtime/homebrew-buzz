cask "buzz" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.9"
  sha256 arm:   "f98a22187650964ec726dc9486a5a4f7b6dc01fb1ca6b45ff0adfbd4536cfbe1",
         intel: "f0162447ab5cb62cf51e93719c90727f77df2ca8f2498d6336a3d8831b5d35f9"

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
