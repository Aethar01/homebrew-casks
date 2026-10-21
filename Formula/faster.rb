class Faster < Formula
  desc "Internet speed test in your terminal"
  homepage "https://github.com/Aethar01/faster"
  url "https://github.com/Aethar01/faster/archive/refs/tags/0.1.1.tar.gz"
  sha256 "53326cfc0f272791bbc5ab5c014a39ced04ff2b1a026c3d1e86b8d249f7aa55b"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-X github.com/Aethar01/faster/internal/faster.version=#{version}"
    system "go", "build", *std_go_args(ldflags:)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/faster -version")
  end
end
