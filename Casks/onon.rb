cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.3"
  sha256 arm:   "f1fc9db7a6001c6a0b6f5e22347b54586b42d02e9349335f38a910a8b2650714",
         intel: "881c796cadd7cc315ec32a57ac17728b0ce5bf542064272f5733d147424c6b10"

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
