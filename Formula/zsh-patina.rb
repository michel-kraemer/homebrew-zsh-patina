class ZshPatina < Formula
  desc "$ A blazingly fast Zsh syntax highlighter"
  homepage "https://github.com/michel-kraemer/zsh-patina"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/michel-kraemer/zsh-patina/releases/download/1.7.0/zsh-patina-v1.7.0-aarch64-apple-darwin.tar.gz"
    sha256 "fc58bccb3ba817b33ffdd23f1569de43cf859f276e61be74bbdedfa0377f47f2"
  else
    url "https://github.com/michel-kraemer/zsh-patina/releases/download/1.7.0/zsh-patina-v1.7.0-x86_64-apple-darwin.tar.gz"
    sha256 "8b5f512bb04e0366f8a88bc12a08ea17f93c60d43ac88b624d456dfb68f82f18"
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
