cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.8.1"
  sha256 arm:   "892b4f35b77f80bb97a4a456691f9c172fffb41646007e2207428c73981145a4",
         intel: "38522ec03e571848e06ea758dc2b978e5b27d7426d3be2f086261d4e4ea41b14"

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
