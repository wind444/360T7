#!/bin/bash
#
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
sed -i 's/192.168.1.1/192.168.3.1/' package/base-files/files/bin/config_generate
sed -i 's/ImmortalWrt/OpenWrt/' package/base-files/files/bin/config_generate
sed -i 's/ImmortalWrt-2.4G/NW2.4G/' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
sed -i 's/ImmortalWrt-5G/NW/' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
sed -i 's/ImmortalWrt-6G/NW6G/' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
sed -i 's/encryption=none/encryption=sae-mixed/' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
sed -i '/encryption=sae-mixed/a \ \ \ \ set wireless.default_${dev}.key=blue1235' package/mtk/applications/mtwifi-cfg/files/mtwifi.sh
git clone https://github.com/xiaorouji/openwrt-passwall.git package/passwall
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/passwall-packages
git clone https://github.com/immortalwrt/packages.git immortalwrt-packages && rm -rf ./feeds/packages/lang/golang && mv ./immortalwrt-packages/lang/golang feeds/packages/lang/golang && rm -rf ./immortalwrt-packages
