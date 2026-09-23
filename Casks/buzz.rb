cask "buzz" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.24"
  sha256 arm:   "d77adc83bc4f7d32c59d0517a082a7951f4a345867f629383bdf29e325aa5e24",
         intel: "0883783e3cae4cc200fbb8db7412a047695526afefdc8e44f40ff1a93507909a"

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
