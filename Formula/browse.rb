class Browse < Formula
  desc "Fast CLI for browser automation, built on Playwright"
  homepage "https://github.com/forjd/browse"
  version "0.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/forjd/browse/releases/download/browse-v0.14.0/browse-darwin-arm64"
      sha256 "6c8726734e7ce2eae284abcd1279856f1dacc055d17b8da6912831558334dcad"
    else
      url "https://github.com/forjd/browse/releases/download/browse-v0.14.0/browse-darwin-x86_64"
      sha256 "cba3fdb8895d137b30e2ef7716c5986eefb170f00bce0b582611c8439daeb61c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/forjd/browse/releases/download/browse-v0.14.0/browse-linux-arm64"
      sha256 "e198928d1223b45cc831806bd29f5ef008250d158f63867a8b914ae10231fbb0"
    else
      url "https://github.com/forjd/browse/releases/download/browse-v0.14.0/browse-linux-x86_64"
      sha256 "8ca18462647b8f3ed1a802a67352b7fee13004c526e0c6fde3f40b6d625eb1f1"
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
