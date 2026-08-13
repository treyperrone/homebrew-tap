class Warren < Formula
  desc "Browse AWS accounts and connect to EC2 instances over SSM"
  homepage "https://github.com/treyperrone/warren"
  version "1.0.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/treyperrone/warren/releases/download/v1.0.0/warren_darwin_arm64.tar.gz"
      sha256 "75645e1617f40da1ac463b49fb754209e5b221ebbad33c53a3404e6d108e6849"
    end
    on_intel do
      url "https://github.com/treyperrone/warren/releases/download/v1.0.0/warren_darwin_amd64.tar.gz"
      sha256 "b1f1e6e92697486fe5e3251c6eae4c044456a8c2337e4e282c2361cec42a0d2c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/treyperrone/warren/releases/download/v1.0.0/warren_linux_arm64.tar.gz"
      sha256 "81f0695f80cba23e184e07d76bb36bf1a8698a6ccdbaad3531c979e5f04a2e84"
    end
    on_intel do
      url "https://github.com/treyperrone/warren/releases/download/v1.0.0/warren_linux_amd64.tar.gz"
      sha256 "fb0bd63bc898cd3ff19acc0110e88441f1aa4f664a55138e284820089172e47b"
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
