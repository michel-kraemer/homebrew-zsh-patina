class ZshPatina < Formula
  desc "$ A blazingly fast Zsh syntax highlighter"
  homepage "https://github.com/michel-kraemer/zsh-patina"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/michel-kraemer/zsh-patina/releases/download/1.5.0/zsh-patina-v1.5.0-aarch64-apple-darwin.tar.gz"
    sha256 "f20f26a7015f087e38b2eb0df0bb0a344614d8017867bbb98b42b8348acc4b5a"
  else
    url "https://github.com/michel-kraemer/zsh-patina/releases/download/1.5.0/zsh-patina-v1.5.0-x86_64-apple-darwin.tar.gz"
    sha256 "514778e30cdaa106fa3a3a7e93152e0e5959ea91388a217507851836fd5dddef"
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
