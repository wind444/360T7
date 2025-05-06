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
sed -i 's/192.168.1.1/192.168.10.1/' package/base-files/files/bin/config_generate
#sed -i 's/ImmortalWrt/OpenWrt/' package/base-files/files/bin/config_generate
sed -i 's/ImmortalWrt-2.4G/NW2.4G/' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
sed -i 's/ImmortalWrt-5G/NW/' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
sed -i 's/ImmortalWrt-6G/NW6G/' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
sed -i 's/encryption=none/encryption=sae-mixed/' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
sed -i '/encryption=sae-mixed/a \ \ \ \ set wireless.default_${dev}.key=blue1235' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall.git package/passwall
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall-packages.git package/passwall-packages
rm -rf ./feeds/luci/applications/luci-app-passwall && cp -r ./package/passwall/luci-app-passwall ./feeds/luci/applications/luci-app-passwall
rm -rf ./feeds/packages/net/chinadns-ng && cp -r ./package/passwall-packages/chinadns-ng ./feeds/packages/net/chinadns-ng
rm -rf ./feeds/packages/net/dns2socks && cp -r ./package/passwall-packages/dns2socks ./feeds/packages/net/dns2socks
rm -rf ./feeds/packages/net/ipt2socks && cp -r ./package/passwall-packages/ipt2socks ./feeds/packages/net/ipt2socks
rm -rf ./feeds/packages/net/microsocks && cp -r ./package/passwall-packages/microsocks ./feeds/packages/net/microsocks
rm -rf ./feeds/packages/net/tcping && cp -r ./package/passwall-packages/tcping ./feeds/packages/net/tcping
rm -rf ./feeds/packages/net/sing-box && cp -r ./package/passwall-packages/sing-box ./feeds/packages/net/sing-box
rm -rf ./feeds/packages/net/xray-core && cp -r ./package/passwall-packages/xray-core ./feeds/packages/net/xray-core
rm -rf ./feeds/packages/net/v2ray-geodata && cp -r ./package/passwall-packages/v2ray-geodata ./feeds/packages/net/v2ray-geodata
rm -rf ./feeds/packages/net/v2ray-plugin && cp -r ./package/passwall-packages/v2ray-plugin ./feeds/packages/net/v2ray-plugin
rm -rf ./feeds/packages/net/hysteria && cp -r ./package/passwall-packages/hysteria ./feeds/packages/net/hysteria
rm -rf ./feeds/packages/net/naiveproxy && cp -r ./package/passwall-packages/naiveproxy ./feeds/packages/net/naiveproxy
rm -rf ./feeds/packages/net/shadowsocks-libev && cp -r ./package/passwall-packages/shadowsocks-libev ./feeds/packages/net/shadowsocks-libev
rm -rf ./feeds/packages/net/shadowsocks-rust && cp -r ./package/passwall-packages/shadowsocks-rust ./feeds/packages/net/shadowsocks-rust
rm -rf ./feeds/packages/net/shadowsocksr-libev && cp -r ./package/passwall-packages/shadowsocksr-libev ./feeds/packages/net/shadowsocksr-libev
rm -rf ./feeds/packages/net/simple-obfs && cp -r ./package/passwall-packages/simple-obfs ./feeds/packages/net/simple-obfs
rm -rf ./feeds/packages/net/trojan-plus && cp -r ./package/passwall-packages/trojan-plus ./feeds/packages/net/trojan-plus
rm -rf ./feeds/packages/net/tuic-client && cp -r ./package/passwall-packages/tuic-client ./feeds/packages/net/tuic-client
rm -rf ./feeds/packages/net/xray-plugin && cp -r ./package/passwall-packages/xray-plugin ./feeds/packages/net/xray-plugin
# 修改 ./feeds/luci/applications/luci-app-passwall/luasrc/model/cbi/passwall/client/rule.lua
sed -i 's|https://api.github.com/repos/Loyalsoldier/v2ray-rules-dat/releases/latest|https://api.github.com/repos/najloa/geoip/releases/latest|g' ./feeds/luci/applications/luci-app-passwall/luasrc/model/cbi/passwall/client/rule.lua
sed -i 's|translate("Loyalsoldier/geosite")|translate("najloa/geosite")|g' ./feeds/luci/applications/luci-app-passwall/luasrc/model/cbi/passwall/client/rule.lua
sed -i 's|translate("Loyalsoldier/geoip")|translate("najloa/geoip")|g' ./feeds/luci/applications/luci-app-passwall/luasrc/model/cbi/passwall/client/rule.lua
sed -i 's|translate("Loyalsoldier/v2ray-rules-dat")|translate("najloa/v2ray-rules-dat")|g' ./feeds/luci/applications/luci-app-passwall/luasrc/model/cbi/passwall/client/rule.lua
sed -i 's|https://fastly.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/gfw.txt|https://raw.githubusercontent.com/najloa/geoip/rules/proxy-list.txt|g' ./feeds/luci/applications/luci-app-passwall/luasrc/model/cbi/passwall/client/rule.lua
# 修改 ./feeds/luci/applications/luci-app-passwall/root/usr/share/passwall/0_default_config
sed -i 's|https://api.github.com/repos/Loyalsoldier/v2ray-rules-dat/releases/latest|https://api.github.com/repos/najloa/geoip/releases/latest|g' ./feeds/luci/applications/luci-app-passwall/root/usr/share/passwall/0_default_config
sed -i 's|https://fastly.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/gfw.txt|https://raw.githubusercontent.com/najloa/geoip/rules/proxy-list.txt|g' ./feeds/luci/applications/luci-app-passwall/root/usr/share/passwall/0_default_config
# 修改 ./feeds/luci/applications/luci-app-passwall/root/usr/share/passwall/rule_update.lua
sed -i 's|https://api.github.com/repos/Loyalsoldier/v2ray-rules-dat/releases/latest|https://api.github.com/repos/najloa/geoip/releases/latest|g' ./feeds/luci/applications/luci-app-passwall/root/usr/share/passwall/rule_update.lua
sed -i 's|https://fastly.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/gfw.txt|https://raw.githubusercontent.com/najloa/geoip/rules/proxy-list.txt|g' ./feeds/luci/applications/luci-app-passwall/root/usr/share/passwall/rule_update.lua
sed -i 's|local excluded_domain = {[^}]*}|local excluded_domain = {}|g' ./feeds/luci/applications/luci-app-passwall/root/usr/share/passwall/rule_update.lua
curl -s https://core.telegram.org/resources/cidr.txt | perl -ne 'print "$_\n" if /^((\d{1,3}\.){3}\d{1,3}\/\d+|([0-9a-fA-F]{1,4}:){2,7}[0-9a-fA-F]{1,4}\/\d{1,3})$/g' > ./feeds/luci/applications/luci-app-passwall/root/usr/share/passwall/rules/proxy_ip
: > ./feeds/luci/applications/luci-app-passwall/root/usr/share/passwall/rules/chnlist
: > ./feeds/luci/applications/luci-app-passwall/root/usr/share/passwall/rules/proxy_host
: > ./feeds/luci/applications/luci-app-passwall/root/usr/share/passwall/rules/direct_host
: > ./feeds/luci/applications/luci-app-passwall/root/usr/share/passwall/rules/direct_ip
cp -r ./package/passwall-packages/geoview ./feeds/packages/net/geoview
# sed -i '/PKG_BUILD_DEPENDS:=/s/$/ upx\/host/' feeds/packages/net/geoview/Makefile
# sed -i '/\$(INSTALL_DIR) $(1)\/usr\/bin/a \ \tupx --best --lzma $(PKG_INSTALL_DIR)/usr/bin/geoview' feeds/packages/net/geoview/Makefile
git clone --depth 1 https://github.com/immortalwrt/packages.git immortalwrt-packages && rm -rf ./feeds/packages/lang/golang && mv ./immortalwrt-packages/lang/golang feeds/packages/lang/golang
cd immortalwrt-packages && git fetch origin 0c43aa312737634bd564c1ea46e74582c4bdf550 && git checkout 0c43aa312737634bd564c1ea46e74582c4bdf550 && cd .. && rm -rf ./feeds/packages/net/haproxy && mv ./immortalwrt-packages/net/haproxy feeds/packages/net/haproxy && rm -rf ./immortalwrt-packages
