class Browse < Formula
  desc "Fast CLI for browser automation, built on Playwright"
  homepage "https://github.com/forjd/browse"
  version "0.15.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/forjd/browse/releases/download/browse-v0.15.0/browse-darwin-arm64"
      sha256 "2ce98a689b5a4335c9b31245819759597c2fca799795289822f98a20d9477d7d"
    else
      url "https://github.com/forjd/browse/releases/download/browse-v0.15.0/browse-darwin-x86_64"
      sha256 "f012d511e7cb0af0eafa2a3a0cd6230df167d2be05954fc03f37b2ef67ffe0a9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/forjd/browse/releases/download/browse-v0.15.0/browse-linux-arm64"
      sha256 "49dfd91dbdfc560a81f016f6dd102acdaafc6f699330e7db436e10e8548c63be"
    else
      url "https://github.com/forjd/browse/releases/download/browse-v0.15.0/browse-linux-x86_64"
      sha256 "d7d61e36910c9d6ea21960884802f7298a7869eb468b418cc267fb384822a6f9"
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
