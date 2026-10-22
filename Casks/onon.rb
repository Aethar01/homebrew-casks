cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.0"
  sha256 arm:   "4aad5b7f0a85f65b6860bbb947ae6d98619477332fb659bbe611002a58d10859",
         intel: "1c0e4c12c2ba9b2cfa9472ad9e5976999bac3d207ebaf87456922ef7fb173e5a"

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
