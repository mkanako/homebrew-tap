class Dnslookup < Formula
  desc "Simple command line utility to make DNS lookups to the specified server"
  homepage "https://github.com/ameshkov/dnslookup"
  url "https://github.com/ameshkov/dnslookup/releases/download/v1.8.1/dnslookup-darwin-amd64-v1.8.1.tar.gz"
  sha256 "44c0635e4b8dad5ca6f0d68747752d77cf560ddd1a58ed047de15fa7738c58d8"
  license "GPLv3"

  def install
    bin.install "dnslookup"
  end

end
