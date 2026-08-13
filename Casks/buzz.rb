cask "buzz" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.11"
  sha256 arm:   "97074433763b878eb13fa2db6d456bc4735161c6a46c88e79f5d8fadfb3e734a",
         intel: "7d3ec201beb44cf0b31cd69037c5b24ae1cff057638a06dca7bb0d27dba81911"

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
