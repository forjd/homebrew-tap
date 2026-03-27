class Browse < Formula
  desc "Fast CLI for browser automation, built on Playwright"
  homepage "https://github.com/forjd/browse"
  version "0.12.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/forjd/browse/releases/download//browse-darwin-arm64"
      sha256 "4b9642fddb13ee4dfad2761a72a69833dacbf39320b88275e0b2ad0965a46c9d"
    else
      url "https://github.com/forjd/browse/releases/download//browse-darwin-x86_64"
      sha256 "ad0c809828297dc6fc0bb5496ca74c734e3a2df3083e826924643c7410b14546"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/forjd/browse/releases/download//browse-linux-arm64"
      sha256 "cd6187df9c4d122456aa0f13bc342fbb095c4a429f507720327808218754c7d9"
    else
      url "https://github.com/forjd/browse/releases/download//browse-linux-x86_64"
      sha256 "52a70cd92cc660ef18f5bfc2b7c4a2bcffd28cb22a67e894e7b6bf86e5890a09"
    end
  end

  def install
    binary = Dir.glob("browse-*").first || "browse"
    bin.install binary => "browse"
  end

  def caveats
    <<~EOS
      browse requires Bun and a browser to work. After installing:
        curl -fsSL https://bun.sh/install | bash
        bunx playwright install chrome
    EOS
  end

  test do
    assert_match "browse", shell_output("#{bin}/browse --version")
  end
end
