class Mosdns < Formula
  desc "一个灵活的 DNS 转发器"
  homepage "https://github.com/IrineSistiana/mosdns"
  url "https://github.com/IrineSistiana/mosdns/releases/download/v5.1.2/mosdns-darwin-amd64.zip"
  version "v5.1.2"
  sha256 "76ec5a101fe55702fab542684ceec3f2fc599df0d4dddfaf3e3ba811aa2190df"
  license "GPLv3"

  def install
    bin.install "mosdns"
  end

  def post_install
    conf = etc/"mosdns/mosdns.yaml"
    return unless !conf.exist?
    system "mkdir", etc/"mosdns"
    system bin/"mosdns", "-gen", conf
  end

  service do
    run [opt_bin/"mosdns", "start", "-d", etc/"mosdns", etc/"mosdns/mosdns.yaml"]
    keep_alive true
    log_path var/"log/mosdns.log"
    error_log_path var/"log/mosdns.log"
  end
end
