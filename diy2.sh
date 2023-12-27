#!/bin/sh
sed -i 's/# CONFIG_WARP_NEW_FW is not set/CONFIG_WARP_NEW_FW=y/' .config
