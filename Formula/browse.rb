class Browse < Formula
  desc "Fast CLI for browser automation, built on Playwright"
  homepage "https://github.com/forjd/browse"
  version "0.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/forjd/browse/releases/download/browse-v0.13.0/browse-darwin-arm64"
      sha256 "fa6408e53367988ed497a50b0fb2b7235b346a862fccd43d00ea7204d2f20bb3"
    else
      url "https://github.com/forjd/browse/releases/download/browse-v0.13.0/browse-darwin-x86_64"
      sha256 "e7ff022e7022b8ac7e0693c35beeca37818fb0bbaf72c07201594f375afe571a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/forjd/browse/releases/download/browse-v0.13.0/browse-linux-arm64"
      sha256 "ac84664c892ae58aadbf8ddf92dd1dd15f6a35f189af6993ee601f6986d74e8a"
    else
      url "https://github.com/forjd/browse/releases/download/browse-v0.13.0/browse-linux-x86_64"
      sha256 "e982f6d28d5ce5291fe855f5d05bc49aa9dce7aed2085072ed1e678e16ef93fe"
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
