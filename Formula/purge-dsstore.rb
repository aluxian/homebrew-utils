class PurgeDsstore < Formula
  desc "Purge .DS_Store every 24h"
  homepage "https://github.com/aluxian/homebrew-utils"
  url "https://github.com/aluxian/homebrew-utils/archive/0.0.1.tar.gz"

  plist_options :startup => true

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>StartInterval</key>
        <integer>86400</integer>
        <key>RunAtLoad</key>
        <true/>
        <key>ProgramArguments</key>
        <array>
          <string>find</string>
          <string>/</string>
          <string>-name</string>
          <string>.DS_Store</string>
          <string>-type</string>
          <string>f</string>
          <string>-delete</string>
        </array>
        <key>UserName</key>
        <string>root</string>
        <key>StandardErrorPath</key>
        <string>/dev/null</string>
        <key>StandardOutPath</key>
        <string>/dev/null</string>
      </dict>
    </plist>
  EOS
  end

  test do
    assert_match "1", "1"
  end
end
