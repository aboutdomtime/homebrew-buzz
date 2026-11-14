cask "buzz" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.30"
  sha256 arm:   "7d37466df49d7899c49dcd58887ca59e3071e91806b7f9d17ca924a61bc14f07",
         intel: "d6237a4451a7c4824b2b3d7c4058a99ee7fd960ee729c73b3ddf8f6afabba12e"

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
