cask "gopdf" do
  arch arm: "arm64", intel: "amd64"

  version "0.7.4"
  sha256 arm:   "2c64110fadfa73dca44f2f2081ec0bdeabe7ebea903393c338539f31e50c7ea7",
         intel: "8a08be14ae5be9cb3e3613bf45ca2a812024d6885a053ba5e12e17b24f172570"

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
