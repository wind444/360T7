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

# Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.6.1/192.168.2.1/g' package/base-files/files/bin/config_generate

# Modify FW
#sed -i 's/mt7981-fw-20230306/mt7981-fw-20230717/g' package/mtk/drivers/mt_wifi/Makefile
#sed -i 's/mt7981-fw-20230411/mt7981-fw-20230717/g' package/mtk/drivers/warp/Makefile
git clone https://github.com/immortalwrt/packages.git immortalwrt-packages && rm -rf ./feeds/packages/lang/golang && mv ./immortalwrt-packages/lang/golang feeds/packages/lang/golang && rm -rf ./immortalwrt-packages
