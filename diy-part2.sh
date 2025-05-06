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
rm -rf ./feeds/luci/applications/luci-app-passwall && \cp -rf ./package/passwall/luci-app-passwall ./feeds/luci/applications/
rm -rf ./feeds/packages/net/chinadns-ng && \cp -rf ./package/passwall-packages/chinadns-ng ./feeds/packages/net/
rm -rf ./feeds/packages/net/dns2socks && \cp -rf ./package/passwall-packages/dns2socks ./feeds/packages/net/
rm -rf ./feeds/packages/net/ipt2socks && \cp -rf ./package/passwall-packages/ipt2socks ./feeds/packages/net/
rm -rf ./feeds/packages/net/microsocks && \cp -rf ./package/passwall-packages/microsocks ./feeds/packages/net/
rm -rf ./feeds/packages/net/tcping && \cp -rf ./package/passwall-packages/tcping ./feeds/packages/net/
rm -rf ./feeds/packages/net/sing-box && \cp -rf ./package/passwall-packages/sing-box ./feeds/packages/net/
rm -rf ./feeds/packages/net/xray-core && \cp -rf ./package/passwall-packages/xray-core ./feeds/packages/net/
rm -rf ./feeds/packages/net/v2ray-geodata && \cp -rf ./package/passwall-packages/v2ray-geodata ./feeds/packages/net/
rm -rf ./feeds/packages/net/v2ray-plugin && \cp -rf ./package/passwall-packages/v2ray-plugin ./feeds/packages/net/
rm -rf ./feeds/packages/net/hysteria && \cp -rf ./package/passwall-packages/hysteria ./feeds/packages/net/
rm -rf ./feeds/packages/net/naiveproxy && \cp -rf ./package/passwall-packages/naiveproxy ./feeds/packages/net/
rm -rf ./feeds/packages/net/shadowsocks-libev && \cp -rf ./package/passwall-packages/shadowsocks-libev ./feeds/packages/net/
rm -rf ./feeds/packages/net/shadowsocks-rust && \cp -rf ./package/passwall-packages/shadowsocks-rust ./feeds/packages/net/
rm -rf ./feeds/packages/net/shadowsocksr-libev && \cp -rf ./package/passwall-packages/shadowsocksr-libev ./feeds/packages/net/
rm -rf ./feeds/packages/net/simple-obfs && \cp -rf ./package/passwall-packages/simple-obfs ./feeds/packages/net/
rm -rf ./feeds/packages/net/trojan-plus && \cp -rf ./package/passwall-packages/trojan-plus ./feeds/packages/net/
rm -rf ./feeds/packages/net/tuic-client && \cp -rf ./package/passwall-packages/tuic-client ./feeds/packages/net/
rm -rf ./feeds/packages/net/xray-plugin && \cp -rf ./package/passwall-packages/xray-plugin ./feeds/packages/net/
\cp -rf ./package/passwall-packages/geoview ./feeds/packages/net/
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
curl -s https://core.telegram.org/resources/cidr.txt > ./feeds/luci/applications/luci-app-passwall/root/usr/share/passwall/rules/proxy_ip
: > ./feeds/luci/applications/luci-app-passwall/root/usr/share/passwall/rules/chnlist
: > ./feeds/luci/applications/luci-app-passwall/root/usr/share/passwall/rules/proxy_host
: > ./feeds/luci/applications/luci-app-passwall/root/usr/share/passwall/rules/direct_host
: > ./feeds/luci/applications/luci-app-passwall/root/usr/share/passwall/rules/direct_ip
# 修改argon主题头部字体/luci-theme-argon/htdocs/luci-static/argon/fonts/TypoGraphica
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon && rm -rf ./feeds/luci/themes/luci-theme-argon && \cp -rf ./package/luci-theme-argon ./feeds/luci/themes/
git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config && rm -rf ./feeds/luci/applications/luci-app-argon-config && \cp -rf ./package/luci-app-argon-config ./feeds/luci/applications/
\cp -f ./fonts/* ./feeds/luci/themes/luci-theme-argon/htdocs/luci-static/argon/fonts
sed -i 's|TypoGraphica|Monoton|g' ./feeds/luci/themes/luci-theme-argon/less/fonts.less
\cp -f ./cascade.less ./feeds/luci/themes/luci-theme-argon/less/cascade.less
# 最新版本go
git clone --depth 1 https://github.com/immortalwrt/packages.git package/immortalwrt-packages && rm -rf ./feeds/packages/lang/golang && \cp -rf ./package/immortalwrt-packages/lang/golang ./feeds/packages/lang/
# haproxy特定版本
cd ./package/immortalwrt-packages && git fetch origin 0c43aa312737634bd564c1ea46e74582c4bdf550 && git checkout 0c43aa312737634bd564c1ea46e74582c4bdf550 && cd .. && cd .. && rm -rf ./feeds/packages/net/haproxy && \cp -rf ./package/immortalwrt-packages/net/haproxy ./feeds/packages/net/ && rm -rf ./package/immortalwrt-packages
