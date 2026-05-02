class ZshPatina < Formula
  desc "$ A blazingly fast Zsh syntax highlighter"
  homepage "https://github.com/michel-kraemer/zsh-patina"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/michel-kraemer/zsh-patina/releases/download/1.6.0/zsh-patina-v1.6.0-aarch64-apple-darwin.tar.gz"
    sha256 "1d64d7ae452db935af7da2c32440baef71225b1db0e191a7ee228884c8b86dd4"
  else
    url "https://github.com/michel-kraemer/zsh-patina/releases/download/1.6.0/zsh-patina-v1.6.0-x86_64-apple-darwin.tar.gz"
    sha256 "39a071ec601cf658187b27abcf78e2ac3e864da2becae824d6a25995c25383a7"
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
