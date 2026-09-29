cask "gopdf" do
  arch arm: "arm64", intel: "amd64"

  version "0.6.0"
  sha256 arm:   "2a606d4131985c36a139ecc7dfb10f0b3dc6ea93af9eeaf4ff0423868cb326a6",
         intel: "c960fc1ffa33c254141b0f5ea675afa94bbc6ff8f1e79016ebc204f163f99e05"

  url "https://github.com/Aethar01/gopdf/releases/download/#{version}/gopdf-#{version}-darwin-#{arch}.dmg"
  name "GoPDF"
  desc "MuPDF-backend PDF viewer written in Go with Lua configuration"
  homepage "https://github.com/Aethar01/gopdf"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "GoPDF.app"
end
