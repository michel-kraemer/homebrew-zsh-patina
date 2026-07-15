class ZshPatina < Formula
  desc "$ A blazingly fast Zsh syntax highlighter"
  homepage "https://github.com/michel-kraemer/zsh-patina"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/michel-kraemer/zsh-patina/releases/download/1.8.0/zsh-patina-v1.8.0-aarch64-apple-darwin.tar.gz"
    sha256 "b1b7afb9e7c8840f269e9f342ffce3c2b90faa221f288484654a80f2a244b296"
  else
    url "https://github.com/michel-kraemer/zsh-patina/releases/download/1.8.0/zsh-patina-v1.8.0-x86_64-apple-darwin.tar.gz"
    sha256 "5ff05eaaa9d4dcdb14d145d1d36f290917d087b0942fa707be6a9686e353f3b9"
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
