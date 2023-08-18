#!/bin/sh
sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate
svn co https://github.com/xiaorouji/openwrt-passwall2/trunk/luci-app-passwall2 package/luci-app-passwall2
