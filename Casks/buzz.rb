cask "buzz" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.3"
  sha256 arm:   "a8a6eda9512d8f18a51a1babb69d92e41ee89137ebda9c0500d07d77f76e0e63",
         intel: "69949fdaf5b5b6f1580fe784a033344a81bf88558b1835e1c27024d0610b8c6c"

  url "https://github.com/block/buzz/releases/download/desktop-v#{version}/Buzz_#{version}_#{arch}.dmg"
  name "Buzz"
  desc "Hive mind communication platform"
  homepage "https://github.com/block/buzz"

  livecheck do
    url :url
    strategy :github_latest
    regex(/^desktop-v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on macos: true

  app "Buzz.app"
end
