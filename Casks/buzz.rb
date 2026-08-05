cask "buzz" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.5"
  sha256 arm:   "a34df1e57f8020322637a8da274679a82c27e42b2b54fa88dea18e3e59221846",
         intel: "56fe61c2e1e0083203dc2ec0650c9eee5d8d2440453425ecaf19cdabefb52308"

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
