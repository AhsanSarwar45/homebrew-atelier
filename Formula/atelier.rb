class Atelier < Formula
  desc "Visual board and multi-project dashboard for tracked work"
  homepage "https://github.com/AhsanSarwar45/atelier"
  version "0.15.2"
  license "MIT"

  # No `depends_on "node"`. Homebrew would install its own node and link it
  # ahead of whatever node manager the reader already runs — which is how most
  # people who have node have it — and a program that quietly changes which node
  # their other work is built with has done them more harm than a missing chat.
  # The chat is never silently dead either way: the program says, in words, that
  # it could not run npm and what that costs.

  on_macos do
    on_arm do
      url "https://github.com/AhsanSarwar45/atelier/releases/download/v0.15.2/atelier-darwin-arm64"
      sha256 "2b75c2304deec143ad3fb11d1e7a2f29403c23d450d354acdc7c13e20bfadba4"
    end
    on_intel do
      url "https://github.com/AhsanSarwar45/atelier/releases/download/v0.15.2/atelier-darwin-x64"
      sha256 "908cf5616e018c4ffa9dad06a0db06d7ced982d4ef5916c86a0618110081fc73"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AhsanSarwar45/atelier/releases/download/v0.15.2/atelier-linux-x64"
      sha256 "f4d539f4fd11888df411f11eaca26eb48356b25bd351f0cef600aa62a6eb0bdf"
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
