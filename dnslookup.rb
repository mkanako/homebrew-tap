class Dnslookup < Formula
  desc "Simple command line utility to make DNS lookups to the specified server"
  homepage "https://github.com/ameshkov/dnslookup"
  url "https://github.com/ameshkov/dnslookup/releases/download/v1.9.1/dnslookup-darwin-amd64-v1.9.1.tar.gz"
  sha256 "504725ffb34bc779ff6dac71d3c8754619154902bf7e194e0f2caaf2e50a12fa"
  license "GPLv3"

  def install
    bin.install "dnslookup"
  end

end
