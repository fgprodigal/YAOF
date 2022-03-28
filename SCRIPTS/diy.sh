#!/bin/bash

# svn export https://github.com/fgprodigal/openwrt-package/trunk/luci-app-blockp2p package/custom/luci-app-blockp2p

cp 999-ray-default-settings package/base-files/files/etc/uci-defaults/999-ray-default-settings

sed -i 's/\%C/\%C build by Ray/g' package/base-files/files/etc/banner