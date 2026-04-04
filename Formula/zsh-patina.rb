class ZshPatina < Formula
  desc "$ A blazingly fast Zsh syntax highlighter"
  homepage "https://github.com/michel-kraemer/zsh-patina"

  if Hardware::CPU.arm?
    url "https://github.com/michel-kraemer/zsh-patina/releases/download/1.3.0/zsh-patina-v1.3.0-aarch64-apple-darwin.tar.gz"
    sha256 "c62fd07d7770382cfda851aa82349f3a5084e1ca96b9a4747d37f9f7ab3537bf"
  else
    url "https://github.com/michel-kraemer/zsh-patina/releases/download/1.3.0/zsh-patina-v1.3.0-x86_64-apple-darwin.tar.gz"
    sha256 "0a68f9c8ae5c381cb08dd463eee149ca7bf3cccd22b5c479cd9da35d8a407b94"
  end

  def install
    bin.install "zsh-patina"
  end
end
