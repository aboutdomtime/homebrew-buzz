cask "buzz" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.4"
  sha256 arm:   "1b8df3e3e781eb9a37eed02a58d48c474c2c4d04c42388513351320c76eeac82",
         intel: "28108389f57e7d607bf278bb87f5f09c9855a880ce261162e8b51cec72c1eb4c"

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
