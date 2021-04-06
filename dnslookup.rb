class Dnslookup < Formula
  desc "Simple command line utility to make DNS lookups to the specified server"
  homepage "https://github.com/ameshkov/dnslookup"
  url "https://github.com/ameshkov/dnslookup/releases/download/v1.4.8/dnslookup-darwin-amd64-v1.4.8.tar.gz"
  sha256 "800ea7f347aae8990edda998244c9daa05a1e0cf8157d4993aea50c7344fd2c3"
  license "GPLv3"

  bottle :unneeded

  def install
    bin.install "dnslookup"
  end

end
