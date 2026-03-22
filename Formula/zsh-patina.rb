class ZshPatina < Formula
  desc "$ A blazingly fast Zsh syntax highlighter"
  homepage "https://github.com/michel-kraemer/zsh-patina"

  if Hardware::CPU.arm?
    url "https://github.com/michel-kraemer/zsh-patina/releases/download/1.1.0/zsh-patina-v1.1.0-aarch64-apple-darwin.tar.gz"
    sha256 "b781b6462f6bc5ef4d2d6f1ddeb0e5e5e2e7d6b93293abcb0d3a5e6c210bfd63"
  else
    url "https://github.com/michel-kraemer/zsh-patina/releases/download/1.1.0/zsh-patina-v1.1.0-x86_64-apple-darwin.tar.gz"
    sha256 "aa07b78f677f434947f1adb6ca52f0dc5f4a021c6f4c54e73ac8c5397dfc08f4"
  end

  def install
    bin.install "zsh-patina"
  end
end
