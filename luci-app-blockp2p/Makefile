#
# Copyright (C) 2014-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-blockp2p
PKG_VERSION:=0.1
PKG_RELEASE:=1

LUCI_MAINTAINER:=Ray <fgprodigal@gmail.com>

LUCI_TITLE:=Block p2p
LUCI_PKGARCH:=all
LUCI_DEPENDS:=+kmod-ipt-ipp2p

define Package/$(PKG_NAME)/postinst
	#!/bin/sh
	$${IPKG_INSTROOT}/etc/init.d/blockp2p stop >/dev/null 2>&1
	$${IPKG_INSTROOT}/etc/init.d/blockp2p enable >/dev/null 2>&1
	$${IPKG_INSTROOT}/etc/init.d/blockp2p start >/dev/null 2>&1
	exit 0
endef

define Package/$(PKG_NAME)/postrm
	#!/bin/sh
	rm -f $${IPKG_INSTROOT}/tmp/iptables_nat_sum >/dev/null 2>&1
	rm -f $${IPKG_INSTROOT}/tmp/iptables_mangle_sum >/dev/null 2>&1
	exit 0
endef

define Package/$(PKG_NAME)/conffiles
/etc/config/blockp2p
endef

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature