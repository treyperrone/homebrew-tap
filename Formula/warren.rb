class Warren < Formula
  desc "Browse AWS accounts and connect to EC2 instances over SSM"
  homepage "https://github.com/treyperrone/warren"
  version "1.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/treyperrone/warren/releases/download/v1.2.0/warren_darwin_arm64.tar.gz"
      sha256 "efa8ce112281324f63185ed78ed1169aab9f54c467bfd80a730ef694724119a0"
    end
    on_intel do
      url "https://github.com/treyperrone/warren/releases/download/v1.2.0/warren_darwin_amd64.tar.gz"
      sha256 "76d0b4ffde53aef21d34692938db2a638f53b553553aae00985a62bded934dc1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/treyperrone/warren/releases/download/v1.2.0/warren_linux_arm64.tar.gz"
      sha256 "f19ccfa368c46d638930ecf6f086cd951b31648b1ee6dbacb28f39152cc3740a"
    end
    on_intel do
      url "https://github.com/treyperrone/warren/releases/download/v1.2.0/warren_linux_amd64.tar.gz"
      sha256 "c2b6728ebc865d94a6c11f5d443d79c836cd4ac91d74411b6617e1fc7fdaef33"
    end
  end

  # No build step: every archive already carries a prebuilt binary with the
  # session-manager-plugin embedded, so there is nothing to compile and no
  # Go toolchain dependency to declare.
  def install
    bin.install "warren"
  end

  test do
    # Confirms the binary runs and reports both its own version and the embedded
    # plugin's, without needing network access or AWS credentials.
    output = shell_output("#{bin}/warren version")
    assert_match "session-manager-plugin", output
  end
end
