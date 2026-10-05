cask "gopdf" do
  arch arm: "arm64", intel: "amd64"

  version "0.7.1"
  sha256 arm:   "f9cf5e3d98005b5409f21ba02fb826aac7bf5393d474907aef20b88ac47e047a",
         intel: "07d72e52066e3830c93c7335c2df5d06a2c9a5aec98ce7b648b4e6a55f5004ad"

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
