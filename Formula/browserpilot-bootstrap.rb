class BrowserpilotBootstrap < Formula
  desc "Minimal BrowserPilot local bootstrap"
  homepage "https://browserpilot.seedsource.dev/install"
  url "https://browserpilot.seedsource.dev/releases/browser-pilot-cli-4.0.2.tgz"
  sha256 "95ee34a41650db5665e779de38bcefabea8f9b9feae40cd991803b993715b3f7"
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
