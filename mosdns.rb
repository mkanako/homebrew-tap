class Mosdns < Formula
  desc "一个灵活的 DNS 转发器"
  homepage "https://github.com/IrineSistiana/mosdns"
  url "https://github.com/IrineSistiana/mosdns/releases/download/v1.6.1/mosdns-darwin-amd64.zip"
  version "v1.6.1"
  sha256 "8130506d3ad4801d0cafdda714a783ad79c74e240ded80abc0a3b186ec2b7053"
  license "GPLv3"

  bottle :unneeded

  def install
    bin.install "mosdns"
  end

  def post_install
    conf = etc/"mosdns/mosdns.yaml"
    return unless !conf.exist?
    system "mkdir", etc/"mosdns"
    system bin/"mosdns", "-gen", conf
  end

  plist_options startup: true

  def plist
    <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
        <dict>
          <key>Label</key>
          <string>#{plist_name}</string>
          <key>ProgramArguments</key>
          <array>
            <string>#{opt_bin}/mosdns</string>
            <string>-dir</string>
            <string>#{etc}/mosdns</string>
            <string>-c</string>
            <string>#{etc}/mosdns/mosdns.yaml</string>
          </array>
          <key>RunAtLoad</key>
          <true/>
          <key>KeepAlive</key>
          <true/>
          <key>StandardErrorPath</key>
          <string>#{var}/log/mosdns.log</string>
          <key>StandardOutPath</key>
          <string>#{var}/log/mosdns.log</string>
        </dict>
      </plist>
    EOS
  end
end
