class Aid < Formula
  desc "Local memory for coding agents and developers working inside Git repositories"
  homepage "https://github.com/forjd/aid"
  url "https://github.com/forjd/aid/archive/refs/tags/v0.4.3.tar.gz"
  sha256 "ecf9151edd753d3152b0a6304c65968f2d16b1b76ab480422a1579f61352bbff"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-o", bin/"aid", "./cmd/aid"
  end

  test do
    assert_match "aid - local memory for coding agents and repos", shell_output("#{bin}/aid --help")
  end
end
