class CastTime < Formula
  desc "Give Claude a clock — local time + timezone context for Claude Code"
  homepage "https://github.com/ek33450505/cast-time"
  url "https://github.com/ek33450505/cast-time/archive/refs/tags/v0.1.1.tar.gz"
  version "0.1.1"
  sha256 "638885b197102c7a288848a3c70a4931841e247bc5058f25d7f04c53d038a294"
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
