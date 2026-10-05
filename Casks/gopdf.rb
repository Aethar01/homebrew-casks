cask "gopdf" do
  arch arm: "arm64", intel: "amd64"

  version "0.7.2"
  sha256 arm:   "feb20fa75dea5c508ce042bd6e0a835c8190ea1de1f52cbb5bc0ef6fffd22389",
         intel: "d40af5d2e17357bc6424f30cb7cd2311372712a69535eca3420290c1c8b363d8"

  url "https://github.com/Aethar01/gopdf/releases/download/#{version}/gopdf-#{version}-darwin-#{arch}.dmg"
  name "GoPDF"
  desc "MuPDF-backend PDF viewer written in Go with Lua configuration"
  homepage "https://github.com/Aethar01/gopdf"

  livecheck do
    url :url
    strategy :github_latest
  end

  postflight_steps do
    run "/usr/bin/xattr",
      args: ["-dr", "com.apple.quarantine", "{{appdir}}/GoPDF.app"]
  end

  depends_on macos: :monterey

  app "GoPDF.app"
end
