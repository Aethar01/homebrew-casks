cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.1"
  sha256 arm:   "1af3df9797c00c58b98e5e102c71b0a77ed622de7b923196ed583a3caba67c49",
         intel: "86a2db67633f35bbf75f4259e1df3cce9a11e93015004b381663317364a196df"

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
