class Atelier < Formula
  desc "Visual board and multi-project dashboard for tracked work"
  homepage "https://github.com/AhsanSarwar45/atelier"
  version "0.23.2"
  license "MIT"

  # Chat orchestration is implemented in Rust. The provider adapters are pinned,
  # self-contained executables, so Node/npm/Python remain build-time-only tools.

  depends_on :linux
  depends_on arch: :x86_64

  on_linux do
    on_intel do
      url "https://github.com/AhsanSarwar45/atelier/releases/download/v0.23.2/atelier-linux-x64.tar.gz"
      sha256 "702f1547fc2721b68d3ac77fc9173dc1c8fe5c98de55def6c595708e4e89f1c6"
    end
  end

  def install
    bin.install "atelier"
    libexec.install "atelier-adapters"
  end

  def caveats
    <<~EOS
      Three commands, and nothing else to start:

        atelier run              start everything and open the board
        atelier service install  have this computer start it at login
        atelier init             set the project in this folder up on it

      It answers your whole network, so the board opens on your phone —
      starting it prints the address to type there.

      The Chat tab and its provider adapters are bundled, so you need neither
      Node, npm, Python, nor a separately installed ACP adapter.

      Project tracking needs git and the Beads CLI (bd):
        https://github.com/gastownhall/beads

      None of these has to be on your PATH. Atelier looks there first, then in
      the ordinary places an installer writes to, which is how the copy started
      at login finds them with no shell behind it.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/atelier --version")
  end
end
