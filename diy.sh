#!/bin/sh
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
sed -i 's/mt7981-fw-20230306/mt7981-fw-20230330/g' package/mtk/drivers/mt_wifi/Makefile
sed -i 's/mt7981-fw-20230411/mt7981-fw-20230330/g' package/mtk/drivers/warp/Makefile
