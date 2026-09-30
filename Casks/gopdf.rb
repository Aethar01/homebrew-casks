cask "gopdf" do
  arch arm: "arm64", intel: "amd64"

  version "0.6.3"
  sha256 arm:   "d8da1711d48ecfba234f9ee601af1cd4bdf8c442263febec95240e95d9bc569a",
         intel: "ba0bbeb0d4960965ecfaeac2949ee5875196210fde25aac783b65abddf846205"

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
