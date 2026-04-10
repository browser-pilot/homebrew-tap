class BrowserpilotBootstrap < Formula
  desc "Minimal BrowserPilot local bootstrap"
  homepage "https://browserpilot.seedsource.dev/install"
  url "https://browserpilot.seedsource.dev/releases/browserpilot-bootstrap-2.1.3.tgz"
  sha256 "2716c56d0b7f443e3486b5e8d4555f8a82df482239dda548833af24e4273ffbc"
  license "Commercial"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    (bin/"browserpilot-bootstrap").write_env_script libexec/"bin/browserpilot-bootstrap.js", {
      "PATH" => "#{Formula["node"].opt_bin}:$PATH"
    }
  end

  test do
    assert_match "browserpilot-bootstrap", shell_output("#{bin}/browserpilot-bootstrap --help")
  end
end
