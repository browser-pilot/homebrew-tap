class BrowserpilotBootstrap < Formula
  desc "Minimal BrowserPilot local bootstrap"
  homepage "https://browserpilot.seedsource.dev/install"
  url "https://browserpilot.seedsource.dev/releases/browserpilot-bootstrap-2.1.4.tgz"
  sha256 "397508d9d566e0bcf7ea57d325e7e5b9db28dfab49d7c1052384569c4ffa8af2"
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
