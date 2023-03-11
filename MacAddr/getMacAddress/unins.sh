#!/bin/bash
ps -ef | grep macaddr | grep -v grep | awk '{print$2}' | xargs kill -9
rm -f /Library/LaunchAgents/com.test.getMacProgram.plist
rm -rf /Applications/MACAddress_BMO_China.app/