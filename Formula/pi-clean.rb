class PiClean < Formula
  desc "Cautious cleanup script for removing pi data and project-local .pi directories"
  homepage "https://github.com/forjd/pi-clean"
  url "https://github.com/forjd/pi-clean/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d181307c75ec787bec77a32b9083d7fbc894283945fbc2adc989dd3512fdc069"
  license "MIT"
  version "1.0.0"

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
