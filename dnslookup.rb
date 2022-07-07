class Dnslookup < Formula
  desc "Simple command line utility to make DNS lookups to the specified server"
  homepage "https://github.com/ameshkov/dnslookup"
  url "https://github.com/ameshkov/dnslookup/releases/download/v1.7.1/dnslookup-darwin-amd64-v1.7.1.tar.gz"
  sha256 "03d41b0302eb9faa8225e7b816178c9b931a4fc8a8b88a914ca6b1f1e10400c1"
  license "GPLv3"

  def install
    bin.install "dnslookup"
  end

end
