class CastTime < Formula
  desc "Give Claude a clock — local time + timezone context for Claude Code"
  homepage "https://github.com/ek33450505/cast-time"
  url "https://github.com/ek33450505/cast-time/archive/refs/tags/v0.2.0.tar.gz"
  version "0.2.0"
  sha256 "40550cc459c13d996d042f98374eab2e7b58e53a8d835e2acb430272a9aeec4f"
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
