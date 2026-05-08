class BrowserpilotBootstrap < Formula
  desc "Minimal BrowserPilot local bootstrap"
  homepage "https://browserpilot.seedsource.dev/install"
  url "https://browserpilot.seedsource.dev/releases/browser-pilot-cli-4.0.8.tgz"
  sha256 "c79863d5a79cd24bb7c759e5925fab1e3e58bfd453d0539fd906cb9a60a4ebff"
  license "Commercial"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    # Install primary binary as `browserpilot` so command surface matches the
    # npm package `@browser-pilot/cli` (which also exposes `browserpilot`).
    # Mac brew users and npm users share identical follow-up commands
    # (`browserpilot setup`, `browserpilot mcp install`, `browserpilot status`).
    (bin/"browserpilot").write <<~EOS
      #!/bin/bash
      if [ -x "#{Formula["node"].opt_bin}/node" ]; then
        exec "#{Formula["node"].opt_bin}/node" "#{libexec}/bin/browserpilot-bootstrap.js" "$@"
      fi
      exec node "#{libexec}/bin/browserpilot-bootstrap.js" "$@"
    EOS
    chmod 0755, bin/"browserpilot"

    # Backwards-compat alias for anyone who installed the old binary name.
    bin.install_symlink bin/"browserpilot" => "browserpilot-bootstrap"
  end

  test do
    assert_match "browserpilot", shell_output("#{bin}/browserpilot --help")
  end
end
