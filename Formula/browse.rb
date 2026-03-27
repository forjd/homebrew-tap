class Browse < Formula
  desc "Fast CLI for browser automation, built on Playwright"
  homepage "https://github.com/forjd/browse"
  version "0.12.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/forjd/browse/releases/download//browse-darwin-arm64"
      sha256 "61a7bdd91dd527c3e5cc6e2c227b9703f1e662567527efea3d46dcac3f394375"
    else
      url "https://github.com/forjd/browse/releases/download//browse-darwin-x86_64"
      sha256 "eb7a5154ed840ce5a8b83be78b0335f863ad5af398f13d5910de054583c8da6f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/forjd/browse/releases/download//browse-linux-arm64"
      sha256 "e1b085bb3617df3d8aaa441bdbdc6357a3b337239e0b65a48bcbf7dbd3dd6aa5"
    else
      url "https://github.com/forjd/browse/releases/download//browse-linux-x86_64"
      sha256 "4d177addb29bf9926d69be0514de24c6446b70f8c7d842e15ae59df4b21f671f"
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
