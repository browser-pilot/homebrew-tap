class BrowserpilotBootstrap < Formula
  desc "Minimal BrowserPilot local bootstrap"
  homepage "https://browserpilot.seedsource.dev/install"
  url "https://browserpilot.seedsource.dev/releases/browser-pilot-cli-4.0.0.tgz"
  sha256 "83c8debc592010c0f611cb392a5b09ed3f693e35589856a1f81f2a9588321396"
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
    bin.install_symlink bin/"browserpilot-bootstrap" => "browserpilot"
  end

  test do
    assert_match "browserpilot-bootstrap", shell_output("#{bin}/browserpilot-bootstrap --help")
  end
end
