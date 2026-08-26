class Warren < Formula
  desc "Browse AWS accounts and connect to EC2 instances over SSM"
  homepage "https://github.com/treyperrone/warren"
  version "1.3.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/treyperrone/warren/releases/download/v1.3.0/warren_1.3.0_darwin_arm64.tar.gz"
      sha256 "350711e87c6c9b090b8154b85796b0cb058f861ea21989994fcd1d871ddaceb1"
    end
    on_intel do
      url "https://github.com/treyperrone/warren/releases/download/v1.3.0/warren_1.3.0_darwin_amd64.tar.gz"
      sha256 "10123b2e43d3d3c9de1c782cf2e5dfa3759c4ab6dc825c4ab8d4d7ac887b48b7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/treyperrone/warren/releases/download/v1.3.0/warren_1.3.0_linux_arm64.tar.gz"
      sha256 "565c5262f36df75881f845c9cee1e5598614668c15648f1a3b8ebb3568880b87"
    end
    on_intel do
      url "https://github.com/treyperrone/warren/releases/download/v1.3.0/warren_1.3.0_linux_amd64.tar.gz"
      sha256 "ce31ad584af82abe6c8e08b131c2a2efd678de92c639c50a992d2a8457b7514c"
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
