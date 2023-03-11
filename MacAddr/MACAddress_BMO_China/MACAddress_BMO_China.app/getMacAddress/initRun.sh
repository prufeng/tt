#!/bin/bash
chmod +x $(cd `dirname $0`; pwd)/*
echo "<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>com.test.getMacProgram</string>
    <key>Program</key>
	 <string>$(cd `dirname $0`; pwd)/runMac.sh</string>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
    <key>LaunchOnlyOnce</key>
    <true/>
    <key>StandardOutPath</key>
    <string>$(cd `dirname $0`; pwd)/startupOut.log</string>
    <key>StandardErrorPath</key>
    <string>$(cd `dirname $0`; pwd)/startupErr.log</string>
  </dict>
</plist>" > $(cd `dirname $0`; pwd)/com.test.getMacProgram.plist
cp $(cd `dirname $0`; pwd)/com.test.getMacProgram.plist /Library/LaunchDaemons/
chmod +x /Library/LaunchDaemons/com.test.getMacProgram.plist
sudo launchctl load -w /Library/LaunchDaemons/com.test.getMacProgram.plist
sudo launchctl start /Library/LaunchDaemons/com.test.getMacProgram.plist