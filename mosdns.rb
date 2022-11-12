class Mosdns < Formula
  desc "一个灵活的 DNS 转发器"
  homepage "https://github.com/IrineSistiana/mosdns"
  url "https://github.com/IrineSistiana/mosdns/releases/download/v4.5.3/mosdns-darwin-amd64.zip"
  version "v4.5.3"
  sha256 "a5ee96d92a60cc1ef6e3119efe851cc37c02fb9443d5fa3dbd4822ce0450cc77"
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
            <string>start</string>
            <string>-d</string>
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
