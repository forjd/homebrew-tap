class Browse < Formula
  desc "Fast CLI for browser automation, built on Playwright"
  homepage "https://github.com/forjd/browse"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/forjd/browse/releases/download//browse-darwin-arm64"
      sha256 "ab33c090d874b550e7f27fb802d1b1fd8b685594da922f01fd515462e7880491"
    else
      url "https://github.com/forjd/browse/releases/download//browse-darwin-x86_64"
      sha256 "3869f9dcdcc6ba3c9ea96bfe02cae67e714a3a3b6c2fc9d27cde8718f2a4bea1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/forjd/browse/releases/download//browse-linux-arm64"
      sha256 "339cde85d7920759cddd67ea2bcfbf3fbf05b0728316ef3122cb17dd91e2bff5"
    else
      url "https://github.com/forjd/browse/releases/download//browse-linux-x86_64"
      sha256 "f9c990f569f76e959fdd088b824a7b60cf6f5f52d7ee2f1368a038cac43a700a"
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
