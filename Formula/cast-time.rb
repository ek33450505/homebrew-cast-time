class CastTime < Formula
  desc "Give Claude a clock — local time + timezone context for Claude Code"
  homepage "https://github.com/ek33450505/cast-time"
  url "https://github.com/ek33450505/cast-time/archive/refs/tags/v0.1.0.tar.gz"
  version "0.1.0"
  sha256 "06e905472b84796ccb4d28bbf6a17f9d60010a2dbfca6c0b858818a5b9259684"
  license "MIT"

  def install
    prefix.install "install.sh"
    prefix.install "uninstall.sh"
    prefix.install "VERSION"
    (prefix/"scripts").install Dir["scripts/*"]
    (prefix/"config").install Dir["config/*"]
  end

  def caveats
    <<~EOS
      cast-time files are staged at #{prefix}.
      To complete installation (copies hook and config into ~/.claude/):
        bash #{prefix}/install.sh

      To uninstall:
        bash #{prefix}/uninstall.sh
    EOS
  end

  test do
    assert_predicate prefix/"install.sh", :exist?
  end
end
