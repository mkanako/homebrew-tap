class Dnslookup < Formula
  desc "Simple command line utility to make DNS lookups to the specified server"
  homepage "https://github.com/ameshkov/dnslookup"
  url "https://github.com/ameshkov/dnslookup/releases/download/v1.7.3/dnslookup-darwin-amd64-v1.7.3.tar.gz"
  sha256 "45ae427ba3728efc1ceec541e12ac18dd37875c378f1e1a8b357e6c0ef4e1ab5"
  license "GPLv3"

  def install
    bin.install "dnslookup"
  end

end
