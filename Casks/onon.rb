cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.4"
  sha256 arm:   "dedcae7d7229cbc03d1f1e02c77af1cf1afee9a1ebb37732cb5b7819132de92c",
         intel: "86b0096a75fc5dbb0b4d9f05e05f7d83763875e8cc9e9d7d32633a2fe1a5691f"

  url "https://github.com/Aethar01/onon/releases/download/#{version}/onon-#{version}-darwin-#{arch}.dmg"
  name "onon"
  desc "Quiet reader for the keyboard"
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
