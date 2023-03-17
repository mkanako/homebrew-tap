class Mosdns < Formula
  desc "一个灵活的 DNS 转发器"
  homepage "https://github.com/IrineSistiana/mosdns"
  url "https://github.com/IrineSistiana/mosdns/releases/download/v5.1.3/mosdns-darwin-amd64.zip"
  version "v5.1.3"
  sha256 "ccaf26debe9713127f62f92e260cfbf43259466f59dcc1f22f47359b5991e74b"
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
