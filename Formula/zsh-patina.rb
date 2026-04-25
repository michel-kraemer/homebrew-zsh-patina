class ZshPatina < Formula
  desc "$ A blazingly fast Zsh syntax highlighter"
  homepage "https://github.com/michel-kraemer/zsh-patina"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/michel-kraemer/zsh-patina/releases/download/1.5.1/zsh-patina-v1.5.1-aarch64-apple-darwin.tar.gz"
    sha256 "d088535c571b6961914263e9f9f2436d4d4c83e8cff0410a74d957250dfb73d8"
  else
    url "https://github.com/michel-kraemer/zsh-patina/releases/download/1.5.1/zsh-patina-v1.5.1-x86_64-apple-darwin.tar.gz"
    sha256 "c5a1519a458e2c6fe4431c8afadcf8e6c71d2f96729f3ed73349c73e183c7b64"
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
