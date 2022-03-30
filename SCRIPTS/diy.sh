#!/bin/bash

# svn export https://github.com/fgprodigal/openwrt-package/trunk/luci-app-blockp2p package/custom/luci-app-blockp2p

cp 999-ray-default-settings package/base-files/files/etc/uci-defaults/999-ray-default-settings

# sed -i 's/redirect_https\t1/redirect_https\t0/g' package/network/services/uhttpd/files/uhttpd.config

sed -i 's/\%C/\%C compiled by Ray/g' package/base-files/files/etc/banner
sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate
sed -i 's/192.168./10.0./g' package/base-files/files/bin/config_generate