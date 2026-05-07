#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
# This script was created by yoier <https://github.com/yoier/r3s-firmware-build/blob/main/diy-part1.sh>

# 克隆 MiniEAP 相关包
git clone https://github.com/kongfl888/luci-app-minieap package/luci-app-minieap
git clone https://github.com/undefined443/openwrt-minieap-sysu package/minieap-sysu

# 修正插件 Makefile
# 1. 修正 luci-app-minieap 的依赖和脚本笔误
sed -i 's/DEPENDS:=+luci/DEPENDS:=+luci +minieap/g' package/luci-app-minieap/Makefile
sed -i 's/po2lmo .\/po\/zh-cn\/minieap1.po/\[ -d .\/po\/zh-cn \] \&\& po2lmo .\/po\/zh-cn\/minieap1.po/g' package/luci-app-minieap/Makefile
sed -i 's/usr\/sbin\/minieap-conver/usr\/sbin\/minieap-ping/3' package/luci-app-minieap/Makefile

# 2. 修正 minieap-sysu 的依赖
sed -i '/URL:=.*/a \	DEPENDS:=+libpcap' package/minieap-sysu/Makefile

# 集成 Lean 源码中的插件
mkdir pkgLean && cd pkgLean
git init
git remote add origin https://github.com/coolsnowwolf/lede.git
git sparse-checkout init --cone
git sparse-checkout set package/lean
git pull origin master
cd ../
cp -ar pkgLean/package/lean package
rm -rf pkgLean