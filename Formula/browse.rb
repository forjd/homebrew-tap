class Browse < Formula
  desc "Fast CLI for browser automation, built on Playwright"
  homepage "https://github.com/forjd/browse"
  version "0.16.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/forjd/browse/releases/download/browse-v0.16.3/browse-darwin-arm64"
      sha256 "aae39328035f71e5f646dc572111e3664353ad652a78193359b2d52430adc2ad"
    else
      url "https://github.com/forjd/browse/releases/download/browse-v0.16.3/browse-darwin-x86_64"
      sha256 "c8605682a3474df8587f5a82080c4e21e3c4b95c6e0d2452e6ec1a87bf43feaa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/forjd/browse/releases/download/browse-v0.16.3/browse-linux-arm64"
      sha256 "50f800c3b3a523661f9f172dc45c039f13d8bfb2d6f3fedabad40c2dba5ac217"
    else
      url "https://github.com/forjd/browse/releases/download/browse-v0.16.3/browse-linux-x86_64"
      sha256 "0efe8a47d8d408fe1a606760a294fd7ed32ef741aed40175b20328225347c9cd"
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
