class Dnslookup < Formula
  desc "Simple command line utility to make DNS lookups to the specified server"
  homepage "https://github.com/ameshkov/dnslookup"
  url "https://github.com/ameshkov/dnslookup/releases/download/v1.4.5/dnslookup-darwin-amd64-v1.4.5.tar.gz"
  sha256 "99e4b2cf078dd9cd9bc9600292fdd564745c86809d25f998c5d60e9c0008dab9"
  license "GPLv3"

  bottle :unneeded

  def install
    bin.install "dnslookup"
  end

end
