cask "onon" do
  arch arm: "arm64", intel: "amd64"

  version "0.8.2"
  sha256 arm:   "422392916cffb81a08a502f9f08aad44b348fbd9a74d5a2c1037bbd327ccd533",
         intel: "3f664b6bf554e13313504d3b65bb30d668162c9675bc052c2fca31c710e16b12"

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
