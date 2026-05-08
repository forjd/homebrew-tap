class Browse < Formula
  desc "Fast CLI for browser automation, built on Playwright"
  homepage "https://github.com/forjd/browse"
  version "0.16.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/forjd/browse/releases/download/browse-v0.16.2/browse-darwin-arm64"
      sha256 "7ce016e74c6c7da6be9cd76be4146e4d157a6872b18abd4868e8daad1a3c1217"
    else
      url "https://github.com/forjd/browse/releases/download/browse-v0.16.2/browse-darwin-x86_64"
      sha256 "fca890a8e1bbb08c6739a29f414389fff53694b83d03ba74ee8034e778dec6ac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/forjd/browse/releases/download/browse-v0.16.2/browse-linux-arm64"
      sha256 "11ffa8da4310480283698bec42c62b8412e7318a20d3a1de47014a78b0d23a60"
    else
      url "https://github.com/forjd/browse/releases/download/browse-v0.16.2/browse-linux-x86_64"
      sha256 "b1fe3a6b7b6ac094a6a299e877bf17f6cadea5e36a90d039d7af92248b405856"
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
        bun x patchright install chrome
    EOS
  end

  test do
    assert_match "browse", shell_output("#{bin}/browse --version")
  end
end
