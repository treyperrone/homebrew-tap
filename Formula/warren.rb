class Warren < Formula
  desc "Browse AWS accounts and connect to EC2 instances over SSM"
  homepage "https://github.com/treyperrone/warren"
  version "1.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/treyperrone/warren/releases/download/v1.1.0/warren_darwin_arm64.tar.gz"
      sha256 "bbde90a6bbbd756a0660c4f01870bcb44fa02758179845c2a2a5ab43b48e74ab"
    end
    on_intel do
      url "https://github.com/treyperrone/warren/releases/download/v1.1.0/warren_darwin_amd64.tar.gz"
      sha256 "12f8d370e325c618e186b65a3f06420db16c1d422fa5db357f21c0321469d3e6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/treyperrone/warren/releases/download/v1.1.0/warren_linux_arm64.tar.gz"
      sha256 "2a26b2cd6927807d5b44bd6cbce15434b7963e4a0c4031b291076fc800b5a5e7"
    end
    on_intel do
      url "https://github.com/treyperrone/warren/releases/download/v1.1.0/warren_linux_amd64.tar.gz"
      sha256 "3bb7038836f48ea45a3e126254819ba689f86fe9891a207c8421fb8707085619"
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
