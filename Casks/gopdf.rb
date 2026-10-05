cask "gopdf" do
  arch arm: "arm64", intel: "amd64"

  version "0.7.3"
  sha256 arm:   "fb1abc05786cb2ec141654d0b38fc483423579bbb5c773625101f9f0c31443fb",
         intel: "f2b780ccaed844f2d7b449aa34906858466e9db6d8ceb5c61588565709809753"

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
