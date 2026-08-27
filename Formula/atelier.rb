class Atelier < Formula
  desc "Visual board and multi-project dashboard for tracked work"
  homepage "https://github.com/AhsanSarwar45/atelier"
  version "0.21.1"
  license "MIT"

  # No `depends_on "node"`. Homebrew would install its own node and link it
  # ahead of whatever node manager the reader already runs — which is how most
  # people who have node have it — and a program that quietly changes which node
  # their other work is built with has done them more harm than a missing chat.
  # The chat is never silently dead either way: the program says, in words, that
  # it could not run npm and what that costs.

  on_macos do
    on_arm do
      url "https://github.com/AhsanSarwar45/atelier/releases/download/v0.21.1/atelier-darwin-arm64"
      sha256 "20466adc527e330d880268727a34621ec2d0039038b53c33a54df5494e4a4f1b"
    end
    on_intel do
      url "https://github.com/AhsanSarwar45/atelier/releases/download/v0.21.1/atelier-darwin-x64"
      sha256 "b87553bf67d7572d0fbd6b5ff308b59bdd0ecd1ad209db6b1665c18febf42a1d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AhsanSarwar45/atelier/releases/download/v0.21.1/atelier-linux-x64"
      sha256 "3f8963793a234676d6f159abddf34a933951200ec8739d129861d74d97c7ca80"
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
