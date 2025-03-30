#!/bin/bash
#
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Add a feed source
git clone https://github.com/xiaorouji/openwrt-passwall.git package/passwall
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/passwall-packages
#echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main" >> "feeds.conf.default"
#echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"
#git clone https://github.com/kenzok8/small-package.git package/small-package && mv ./package/small-package/homebox package/homebox && rm -rf ./package/small-package
#git clone https://github.com/Black-Steel/openwrt-packages-20231128.git package/openwrt-packages-20231128 && mv ./package/openwrt-packages-20231128/luci-app-homebox package/luci-app-homebox && rm -rf ./package/openwrt-packages-20231128
git clone https://github.com/openwrt/openwrt -b d6ffcdbda9c40fb35d44b0db69561c5b403f3e14 openwrt && mv ./openwrt/package/network/utils/udhcpsnoop package/network/utils/udhcpsnoop && mv ./openwrt/package/utils/ufp package/utils/ufp && rm -rf ./openwrt
