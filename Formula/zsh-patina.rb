class ZshPatina < Formula
  desc "$ A blazingly fast Zsh syntax highlighter"
  homepage "https://github.com/michel-kraemer/zsh-patina"

  if Hardware::CPU.arm?
    url "https://github.com/michel-kraemer/zsh-patina/releases/download/1.0.0/zsh-patina-v1.0.0-aarch64-apple-darwin.tar.gz"
    sha256 "dd8afad53f6ea086357962ef639197a564c3cf4fd6156eca3f81842a5e92bb32"
  else
    url "https://github.com/michel-kraemer/zsh-patina/releases/download/1.0.0/zsh-patina-v1.0.0-x86_64-apple-darwin.tar.gz"
    sha256 "912198d6da425ae58d61045555e052b31141b891daa21e1af5da4803b64b3b48"
  end

  def install
    bin.install "zsh-patina"
  end
end
