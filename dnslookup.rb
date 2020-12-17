class Dnslookup < Formula
  desc "Simple command line utility to make DNS lookups to the specified server"
  homepage "https://github.com/ameshkov/dnslookup"
  url "https://github.com/ameshkov/dnslookup/releases/download/v1.4.4/dnslookup-darwin-amd64-v1.4.4.tar.gz"
  sha256 "39a59f846a1e6f2c2834c192b0d5da525819c94551242d4da51c7355dd3f37c6"
  license "GPLv3"

  bottle :unneeded

  def install
    bin.install "dnslookup"
  end

end
