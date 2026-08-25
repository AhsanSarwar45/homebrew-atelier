class Atelier < Formula
  desc "Visual board and multi-project dashboard for tracked work"
  homepage "https://github.com/AhsanSarwar45/atelier"
  version "0.18.0"
  license "MIT"

  # No `depends_on "node"`. Homebrew would install its own node and link it
  # ahead of whatever node manager the reader already runs — which is how most
  # people who have node have it — and a program that quietly changes which node
  # their other work is built with has done them more harm than a missing chat.
  # The chat is never silently dead either way: the program says, in words, that
  # it could not run npm and what that costs.

  on_macos do
    on_arm do
      url "https://github.com/AhsanSarwar45/atelier/releases/download/v0.18.0/atelier-darwin-arm64"
      sha256 "d653d5b4bfff14bac20462f85c327f2a0667fd4524cba39d73c3533a72c87ea7"
    end
    on_intel do
      url "https://github.com/AhsanSarwar45/atelier/releases/download/v0.18.0/atelier-darwin-x64"
      sha256 "6b4f3260b7ae78db9d4c039d5257c2424a2af62c1c95fda5864568bd4e227164"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AhsanSarwar45/atelier/releases/download/v0.18.0/atelier-linux-x64"
      sha256 "27c5bd459000b81ba392b4fa77d2549a104ce37e12a72c7c17d06c0be4c8a4ab"
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
