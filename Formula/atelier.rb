class Atelier < Formula
  desc "Visual board and multi-project dashboard for tracked work"
  homepage "https://github.com/AhsanSarwar45/atelier"
  version "0.14.0"
  license "MIT"

  # No `depends_on "node"`. Homebrew would install its own node and link it
  # ahead of whatever node manager the reader already runs — which is how most
  # people who have node have it — and a program that quietly changes which node
  # their other work is built with has done them more harm than a missing chat.
  # The chat is never silently dead either way: the program says, in words, that
  # it could not run npm and what that costs.

  on_macos do
    on_arm do
      url "https://github.com/AhsanSarwar45/atelier/releases/download/v0.14.0/atelier-darwin-arm64"
      sha256 "3fd8abe2185f37664ecc6f31f1daac04ce5c0f4d055710f6b042686b1917c6b9"
    end
    on_intel do
      url "https://github.com/AhsanSarwar45/atelier/releases/download/v0.14.0/atelier-darwin-x64"
      sha256 "1f098a154464b9a5cec2a47f514aa766d346f7de77083e236c89a5ff8c8a98bb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AhsanSarwar45/atelier/releases/download/v0.14.0/atelier-linux-x64"
      sha256 "819d990a4b9905b193e5d005e6f36fe04692beab55ab4423896ede55d9300091"
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

      The Chat tab needs node and npm on your PATH — your own, whichever way you
      install them. Without them the board and the screens still work, and the
      chat says what is missing.

      `init` needs python3 and the Beads CLI (bd) on your PATH:
        https://github.com/gastownhall/beads
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/atelier --version")
  end
end
