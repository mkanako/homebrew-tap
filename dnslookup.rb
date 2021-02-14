class Dnslookup < Formula
  desc "Simple command line utility to make DNS lookups to the specified server"
  homepage "https://github.com/ameshkov/dnslookup"
  url "https://github.com/ameshkov/dnslookup/releases/download/v1.4.6/dnslookup-darwin-amd64-v1.4.6.tar.gz"
  sha256 "216453c102aeaf606497048e0475fa6f8fbee9a777ee32998204d2aa2d170f34"
  license "GPLv3"

  bottle :unneeded

  def install
    bin.install "dnslookup"
  end

end
