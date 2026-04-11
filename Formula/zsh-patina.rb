class ZshPatina < Formula
  desc "$ A blazingly fast Zsh syntax highlighter"
  homepage "https://github.com/michel-kraemer/zsh-patina"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/michel-kraemer/zsh-patina/releases/download/1.4.0/zsh-patina-v1.4.0-aarch64-apple-darwin.tar.gz"
    sha256 "cf2dbe63a988993c4b83ee0f4172ab1faea43426f8ea89a0699c8f9da35de5df"
  else
    url "https://github.com/michel-kraemer/zsh-patina/releases/download/1.4.0/zsh-patina-v1.4.0-x86_64-apple-darwin.tar.gz"
    sha256 "a9d45ff47d49053d51c153c5a140e652aa3d20d93cbb9654cc02152402663fa6"
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
