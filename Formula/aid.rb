class Aid < Formula
  desc "Local memory for coding agents and developers working inside Git repositories"
  homepage "https://github.com/forjd/aid"
  url "https://github.com/forjd/aid/archive/refs/tags/v0.4.4.tar.gz"
  sha256 "7c3a22cd5bce50dc1f4c2c91bf989b5455164bd5a43d2c4175e64129b7e43889"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-o", bin/"aid", "./cmd/aid"
  end

  test do
    assert_match "aid - local memory for coding agents and repos", shell_output("#{bin}/aid --help")
  end
end
