class ZshPatina < Formula
  desc "$ A blazingly fast Zsh syntax highlighter"
  homepage "https://github.com/michel-kraemer/zsh-patina"

  if Hardware::CPU.arm?
    url "https://github.com/michel-kraemer/zsh-patina/releases/download/1.2.0/zsh-patina-v1.2.0-aarch64-apple-darwin.tar.gz"
    sha256 "d9c56208f886dd35bd98a334c7cdb0333552929efd11e6a2682d980b00f3ba66"
  else
    url "https://github.com/michel-kraemer/zsh-patina/releases/download/1.2.0/zsh-patina-v1.2.0-x86_64-apple-darwin.tar.gz"
    sha256 "2c2a8e7286a2db6fb61bb5b9278a2e6a3643e538807d047a639a5a13e3ab64a7"
  end

  def install
    bin.install "zsh-patina"
  end
end
