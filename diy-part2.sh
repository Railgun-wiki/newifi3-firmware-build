#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
# This script was created by yoier <https://github.com/yoier/r3s-firmware-build/blob/main/diy-part2.sh>
nowDate=`TZ="UTC-8" date "+%Y-%m-%d %H:%M:%S"`
sed -i "/return table/i table.appendChild(E('tr', { 'class': 'tr' }, [E('td', { 'class': 'td left', 'width': '33%' }, ['仓库地址 | 构建时间']),E('td', { 'class': 'td left' }, [E('a', { 'href': 'https://github.com/Railgun-wiki/newifi3-firmware-build', 'target': '_blank' }, 'Powered by Railgun-wiki/newifi3-firmware-build | $nowDate')])]));" feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/include/10_system.js

# 使用清华源 (针对编译出的固件 opkg 软件源)
sed -i 's/downloads.openwrt.org/mirrors.tuna.tsinghua.edu.cn\/openwrt/g' package/base-files/files/etc/opkg/distfeeds.conf

# 修改 NTP 服务器
sed -i 's/0.openwrt.pool.ntp.org/ntp.aliyun.com/g' package/base-files/files/etc/config/system
sed -i 's/1.openwrt.pool.ntp.org/ntp.tencent.com/g' package/base-files/files/etc/config/system
sed -i 's/2.openwrt.pool.ntp.org/pool.ntp.org/g' package/base-files/files/etc/config/system
sed -i '/3.openwrt.pool.ntp.org/d' package/base-files/files/etc/config/system
