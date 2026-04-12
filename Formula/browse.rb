class Browse < Formula
  desc "Fast CLI for browser automation, built on Playwright"
  homepage "https://github.com/forjd/browse"
  version "0.16.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/forjd/browse/releases/download/browse-v0.16.1/browse-darwin-arm64"
      sha256 "0f0e7cb850b9885c63d9d122fc02b61ba3493b478ab8f99922409c279c49737c"
    else
      url "https://github.com/forjd/browse/releases/download/browse-v0.16.1/browse-darwin-x86_64"
      sha256 "e9b0228ff61af2a4ac96fa2096d6d21b504eba48e9699b92e41fdb02c604702f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/forjd/browse/releases/download/browse-v0.16.1/browse-linux-arm64"
      sha256 "c20c291a11bfc613bc78646e1d5f0c3469965bde6b1d3a9bd6abc33e44e0c6d2"
    else
      url "https://github.com/forjd/browse/releases/download/browse-v0.16.1/browse-linux-x86_64"
      sha256 "c6576f386505a1d73b239e86785fc1a4447055f7e0ae1909c06a43138d851b33"
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
