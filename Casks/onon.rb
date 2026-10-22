cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.2"
  sha256 arm:   "31adac8d746a40e3f65e21c326564b8726e75f7880525a2560cdfecae7cc604d",
         intel: "dbd4d584fea6e0b7b1210594c6844bd5eac606a5e488b823a233e0aa7db7bd29"

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
