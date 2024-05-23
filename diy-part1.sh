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
sed -i 's/mt7981-fw-20230306/mt7981-fw-20230717/g' package/mtk/drivers/mt_wifi/Makefile
sed -i 's/mt7981-fw-20230411/mt7981-fw-20230717/g' package/mtk/drivers/warp/Makefile
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate
