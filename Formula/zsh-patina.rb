class ZshPatina < Formula
  desc "$ A blazingly fast Zsh syntax highlighter"
  homepage "https://github.com/michel-kraemer/zsh-patina"

  if Hardware::CPU.arm?
    url "https://github.com/michel-kraemer/zsh-patina/releases/download/0.1.0/zsh-patina-v0.1.0-aarch64-apple-darwin.tar.gz"
    sha256 "a341cdbd404696b89f69e51026d0e5cdc251c8d3c2d38212dd1dc9769b361ffc"
  else
    url "https://github.com/michel-kraemer/zsh-patina/releases/download/0.1.0/zsh-patina-v0.1.0-x86_64-apple-darwin.tar.gz"
    sha256 "00a3da746e3dc9d7bc454cf13224828e69a8c5defa85886dd674718d002aad3c"
  end

  def install
    bin.install "zsh-patina"
  end
end
