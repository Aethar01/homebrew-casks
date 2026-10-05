cask "gopdf" do
  arch arm: "arm64", intel: "amd64"

  version "0.7.0"
  sha256 arm:   "efe03c992a2c277c3ae265e45e5c5ac497d4884ae21720e0833c3d5144b75e2d",
         intel: "caa413c96e2cdbdf03e9f1d9dc469e2de95e406713b62f1fcae0e17e9a525e87"

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
