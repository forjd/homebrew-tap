class Browse < Formula
  desc "Fast CLI for browser automation, built on Playwright"
  homepage "https://github.com/forjd/browse"
  version "0.12.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/forjd/browse/releases/download//browse-darwin-arm64"
      sha256 "469467201900b7597032a059b0ab24adba10a6524e4bfa6c3d618c492cbfc56b"
    else
      url "https://github.com/forjd/browse/releases/download//browse-darwin-x86_64"
      sha256 "e312db4139cbe9177fe92be3f1aad521d5d33b7b9003b5da1327c94f5960cc27"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/forjd/browse/releases/download//browse-linux-arm64"
      sha256 "9b8145eb4ccfed57855cd3d80e8df0a2afab204c787444f1b4983a4594585e4c"
    else
      url "https://github.com/forjd/browse/releases/download//browse-linux-x86_64"
      sha256 "c66f83ce485120c67d5040563c22368e93140bfe4a47c0cf971ff0b6ccb115b6"
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
