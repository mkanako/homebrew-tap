class Dnslookup < Formula
  desc "Simple command line utility to make DNS lookups to the specified server"
  homepage "https://github.com/ameshkov/dnslookup"
  url "https://github.com/ameshkov/dnslookup/releases/download/v1.4.7/dnslookup-darwin-amd64-v1.4.7.tar.gz"
  sha256 "d9e2c1cfe4be7db3eb472e006e8e97963a883d450040ee629d487328cec17ce7"
  license "GPLv3"

  bottle :unneeded

  def install
    bin.install "dnslookup"
  end

end
