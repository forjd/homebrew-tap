class Browse < Formula
  desc "Fast CLI for browser automation, built on Playwright"
  homepage "https://github.com/forjd/browse"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/forjd/browse/releases/download/browse-v0.11.0/browse-darwin-arm64"
      sha256 "452bf5bd5eb6588f5b1838adbcb81990edb7bbafd0d22bac2d35219480030306"
    else
      url "https://github.com/forjd/browse/releases/download/browse-v0.11.0/browse-darwin-x86_64"
      sha256 "2b44da2d22d7768958d6957c5ce4303c262260a102fc4eafad0be87b64aaa729"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/forjd/browse/releases/download/browse-v0.11.0/browse-linux-arm64"
      sha256 "e59d9e40830910a7a516b008fe964181f03845be5385704e89faa679bd2e7a05"
    else
      url "https://github.com/forjd/browse/releases/download/browse-v0.11.0/browse-linux-x86_64"
      sha256 "bb1c2dff14a4eda027f8a8773d1c4a26447c9b824751edf04bc8f6e53689ce53"
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
