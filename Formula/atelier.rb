class Atelier < Formula
  desc "Visual board and multi-project dashboard for tracked work"
  homepage "https://github.com/AhsanSarwar45/atelier"
  version "0.13.0"
  license "MIT"

  # The chat helper is started beside the server and is written for node, so an
  # install without it serves the board and answers nothing on the Chat tab.
  # Asked for here rather than left to the reader: the chat is half of what this
  # program is, and a silent half is worse than a bigger download.
  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/AhsanSarwar45/atelier/releases/download/v0.13.0/atelier-darwin-arm64"
      sha256 "598ca7cef79c302a86640b18d23b8462f71ffef67191c5e0ec741d512e58e815"
    end
    on_intel do
      url "https://github.com/AhsanSarwar45/atelier/releases/download/v0.13.0/atelier-darwin-x64"
      sha256 "bbed7648251bf80894d48bad449db884a757f3c4b78d79548cbfbcefa7b291ef"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AhsanSarwar45/atelier/releases/download/v0.13.0/atelier-linux-x64"
      sha256 "6623b97b938556b6092f28749b1939073dbf5c62659623167e7fd5628af0e735"
    end
  end

  def install
    bin.install Dir["atelier-*"].first => "atelier"
  end

  def caveats
    <<~EOS
      Three commands, and nothing else to start:

        atelier run              start everything and open the board
        atelier service install  have this computer start it at login
        atelier init             set the project in this folder up on it

      It answers your whole network, so the board opens on your phone —
      starting it prints the address to type there.

      `init` needs python3 and the Beads CLI (bd) on your PATH:
        https://github.com/gastownhall/beads
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/atelier --version")
  end
end
