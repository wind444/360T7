#!/bin/bash
#
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
# find . -type d -name "passwall"
sed -i 's/192.168.1.1/192.168.3.1/' package/base-files/files/bin/config_generate
sed -i 's/ImmortalWrt/OpenWrt/' package/base-files/files/bin/config_generate
sed -i 's/ImmortalWrt-2.4G/NW2.4G/' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
sed -i 's/ImmortalWrt-5G/NW/' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
sed -i 's/ImmortalWrt-6G/NW6G/' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
sed -i 's/encryption=none/encryption=sae-mixed/' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
sed -i '/encryption=sae-mixed/a \ \ \ \ set wireless.default_${dev}.key=blue1235' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
git clone https://github.com/xiaorouji/openwrt-passwall.git package/passwall
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/passwall-packages
rm -rf ./feeds/luci/applications/luci-app-passwall && cp -r ./package/passwall/luci-app-passwall ./feeds/luci/applications/luci-app-passwall
rm -rf ./feeds/packages/net/chinadns-ng && cp -r ./package/passwall-packages/chinadns-ng ./feeds/packages/net/chinadns-ng
rm -rf ./feeds/packages/net/dns2socks && cp -r ./package/passwall-packages/dns2socks ./feeds/packages/net/dns2socks
rm -rf ./feeds/packages/net/ipt2socks && cp -r ./package/passwall-packages/ipt2socks ./feeds/packages/net/ipt2socks
rm -rf ./feeds/packages/net/microsocks && cp -r ./package/passwall-packages/microsocks ./feeds/packages/net/microsocks
rm -rf ./feeds/packages/net/tcping && cp -r ./package/passwall-packages/tcping ./feeds/packages/net/tcping
rm -rf ./feeds/packages/net/xray-core && cp -r ./package/passwall-packages/xray-core ./feeds/packages/net/xray-core
rm -rf ./feeds/packages/net/v2ray-geodata && cp -r ./package/passwall-packages/v2ray-geodata ./feeds/packages/net/v2ray-geodata
rm -rf ./feeds/packages/net/v2ray-plugin && cp -r ./package/passwall-packages/v2ray-plugin ./feeds/packages/net/v2ray-plugin
cp -r ./package/passwall-packages/geoview ./feeds/packages/net/geoview
sed -i 's/^GO_PKG_LDFLAGS:=-s -w$/GO_PKG_LDFLAGS:=-s -w -buildid=/' feeds/packages/net/geoview/Makefile
sed -i '/\$(INSTALL_BIN).*geoview/a \ \tupx --best $(1)/usr/bin/geoview' feeds/packages/net/geoview/Makefile
git clone https://github.com/immortalwrt/packages.git immortalwrt-packages && rm -rf ./feeds/packages/lang/golang && mv ./immortalwrt-packages/lang/golang feeds/packages/lang/golang && rm -rf ./immortalwrt-packages
