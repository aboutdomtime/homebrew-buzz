cask "buzz" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.27"
  sha256 arm:   "7a1a086482219c50cd6be51348cc571f6243f0db6483b963826f09cd3de0b6d9",
         intel: "c262fd9deb93838f93e1278d1a49270e434c7b8fc89b39c02732a074dab9e5e2"

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
