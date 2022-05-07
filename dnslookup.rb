class Dnslookup < Formula
  desc "Simple command line utility to make DNS lookups to the specified server"
  homepage "https://github.com/ameshkov/dnslookup"
  url "https://github.com/ameshkov/dnslookup/releases/download/v1.6.0/dnslookup-darwin-amd64-v1.6.0.tar.gz"
  sha256 "51075d71412685f308eb8e599c0f042841328cc7d6cf0fd1eb59c65a068d50ca"
  license "GPLv3"

  def install
    bin.install "dnslookup"
  end

end
