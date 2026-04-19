class PiClean < Formula
  desc "Cautious cleanup script for removing pi data and project-local .pi directories"
  homepage "https://github.com/forjd/pi-clean"
  url "https://github.com/forjd/pi-clean/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "14dd879e758c663cc7915f7f5bb0901fbdb590d39ca0465fdeba630f0ff6251b"
  license "MIT"
  version "1.1.0"

  def install
    bin.install "pi-clean.sh" => "pi-clean"
  end

  def caveats
    <<~EOS
      Always preview the cleanup plan first:
        pi-clean --dry-run
    EOS
  end

  test do
    assert_match "Usage: pi-clean", shell_output("#{bin}/pi-clean --help")
  end
end
