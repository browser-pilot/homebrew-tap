class BrowserpilotBootstrap < Formula
  desc "Minimal BrowserPilot local bootstrap"
  homepage "https://browserpilot.seedsource.dev/install"
  url "https://registry.npmjs.org/@browser-pilot/server/-/server-3.1.2.tgz"
  sha256 "b779f0f8f8fea70c3ed4936f6ef6083505ca3d23a121fffbdd78aae69a6982ff"
  license "Commercial"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    (bin/"browserpilot-bootstrap").write <<~EOS
      #!/bin/bash
      if [ -x "#{Formula["node"].opt_bin}/node" ]; then
        exec "#{Formula["node"].opt_bin}/node" "#{libexec}/bin/browserpilot-bootstrap.js" "$@"
      fi
      exec node "#{libexec}/bin/browserpilot-bootstrap.js" "$@"
    EOS
    chmod 0755, bin/"browserpilot-bootstrap"
  end

  test do
    assert_match "browserpilot-bootstrap", shell_output("#{bin}/browserpilot-bootstrap --help")
  end
end
