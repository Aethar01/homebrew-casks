cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.8.0"
  sha256 arm:   "d83a316238e78a38628d0332879ff724c0008799dcdd14e56f21405bb0b86643",
         intel: "97b4d448f44d4ee20734d7641d808b66b1bfdd5c8c51a82d5a0da7147844588b"

  url "https://github.com/Aethar01/onon/releases/download/#{version}/onon-#{version}-darwin-#{arch}.dmg"
  name "onon"
  desc "Keyboard-driven document viewer configured in Lua"
  homepage "https://ononreader.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  postflight_steps do
    run "/usr/bin/xattr",
      args: ["-dr", "com.apple.quarantine", "{{appdir}}/onon.app"]
  end

  depends_on macos: :monterey

  app "onon.app"
  binary "#{appdir}/onon.app/Contents/MacOS/onon"

  zap trash: [
    "~/Library/Application Support/onon",
    "~/Library/Caches/onon",
  ]
end
