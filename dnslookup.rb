class Dnslookup < Formula
  desc "Simple command line utility to make DNS lookups to the specified server"
  homepage "https://github.com/ameshkov/dnslookup"
  url "https://github.com/ameshkov/dnslookup/releases/download/v1.8.0/dnslookup-darwin-amd64-v1.8.0.tar.gz"
  sha256 "99a8c54d6db1f8a62b22d2f22943ce1998574537ca80e9a29cdd80ec73db0082"
  license "GPLv3"

  def install
    bin.install "dnslookup"
  end

end
