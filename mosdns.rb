class Mosdns < Formula
  desc "一个灵活的 DNS 转发器"
  homepage "https://github.com/IrineSistiana/mosdns"
  url "https://github.com/IrineSistiana/mosdns/releases/download/v3.8.0/mosdns-darwin-amd64.zip"
  version "v3.8.0"
  sha256 "c2884d502eb115ae89864f2a0af0ea683aae3389ff92ba225d4ca8b5df40a9da"
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
