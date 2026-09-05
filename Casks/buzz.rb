cask "buzz" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.22"
  sha256 arm:   "68581945a4c6f9321e7f9c9541a9529db0acbbd7c3247296d1cdd57f989a2ee0",
         intel: "9c49402bd2ce4f84417d29939f5c04f40ae0b76892eedb13a2fd5bd2d3bb971f"

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
