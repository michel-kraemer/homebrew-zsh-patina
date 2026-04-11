class ZshPatina < Formula
  desc "$ A blazingly fast Zsh syntax highlighter"
  homepage "https://github.com/michel-kraemer/zsh-patina"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/michel-kraemer/zsh-patina/releases/download/1.3.1/zsh-patina-v1.3.1-aarch64-apple-darwin.tar.gz"
    sha256 "29920821689d79e2b6e4be0e8ee80075c9e023acc5ba1edd0e11256ce1d279a8"
  else
    url "https://github.com/michel-kraemer/zsh-patina/releases/download/1.3.1/zsh-patina-v1.3.1-x86_64-apple-darwin.tar.gz"
    sha256 "35673e162690a72debf29eeb10938dc5476c98e04e381ce4c7c3731dc30941b3"
  end

  def install
    bin.install "zsh-patina"
    generate_completions_from_executable(bin/"zsh-patina", "completion", shell_parameter_format: :none, shells: [:zsh])
  end

  def caveats
    <<~EOS
      Initialize zsh-patina at the end of your `.zshrc` file by executing:
        echo "eval \\"\\$($(brew --prefix)/bin/zsh-patina activate)\\"" >> ~/.zshrc

      Then, restart your terminal or run:
        exec zsh
    EOS
  end
end
