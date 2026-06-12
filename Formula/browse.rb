class Browse < Formula
  desc "Fast CLI for browser automation, built on Playwright"
  homepage "https://github.com/forjd/browse"
  version "0.16.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/forjd/browse/releases/download/browse-v0.16.4/browse-darwin-arm64"
      sha256 "dc29d946acf07348bebd263212b4312da1bd4714b0c82efc1120032073a2a839"
    else
      url "https://github.com/forjd/browse/releases/download/browse-v0.16.4/browse-darwin-x86_64"
      sha256 "732ac3dcd60cb13add3d3454d4f76247fb62e9341e093364b76e14723006eb08"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/forjd/browse/releases/download/browse-v0.16.4/browse-linux-arm64"
      sha256 "6a7122022f88d25ce5051c3969b93816c36369e9a0f0f462da411ceb565a4209"
    else
      url "https://github.com/forjd/browse/releases/download/browse-v0.16.4/browse-linux-x86_64"
      sha256 "f2ac520b664770c605b93fcd49acff44f0fb6dadfb015efc378a4f8eda260b96"
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
