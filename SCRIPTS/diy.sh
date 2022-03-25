#!/bin/bash

# svn export https://github.com/kiddin9/openwrt-bypass/trunk/luci-app-bypass package/custom/luci-app-bypass

cp -r ../luci-app-blockp2p package/custom/
cp 999-ray-default-settings package/base-files/files/etc/uci-defaults/999-ray-default-settings

sed -i 's/\%C/\%C build by Ray/g' package/base-files/files/etc/banner