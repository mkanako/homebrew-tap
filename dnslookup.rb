class Dnslookup < Formula
  desc "Simple command line utility to make DNS lookups to the specified server"
  homepage "https://github.com/ameshkov/dnslookup"
  url "https://github.com/ameshkov/dnslookup/releases/download/v1.7.0/dnslookup-darwin-amd64-v1.7.0.tar.gz"
  sha256 "bd691d52dc2ae8106afe5dcd9347b4d32e20b94786c8aa46a484967c84fd1ff4"
  license "GPLv3"

  def install
    bin.install "dnslookup"
  end

end
