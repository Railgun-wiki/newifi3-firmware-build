## 下载
软件包均相同；LEDE版系统当主路由接旁路由网关，旁路由防火墙LAN区域需要开启IP动态伪装，否则国内网站不通；而openwrt官方版本不需要，原因暂时未知。

为什么选择 21.02.7？该版本作为最后使用 iptables 的版本，内核完美支持闭源驱动 mt7602e, mt7603e，且插件兼容性最佳。

## 固件特性 (全量集成版)
当前版本已深度集成以下功能，**无需手动安装 IPK**，刷机即用：

- **主题与界面**：
  - 默认使用 **Argon** 主题，完美适配 LuCI。
  - 全界面中文化支持 (含所有插件)。
- **认证支持**：
  - 内置 **MiniEAP** 及其 LuCI 管理界面（支持 SYSU 等 802.1X 认证）。
- **游戏加速与网络优化**：
  - 完整支持 **雷神加速器 (LeigodAcc)** 脚本及其所有依赖 (`libpcap`, `tc-full`, `conntrack`, `kmod-sched` 等)。
  - 内置 `kmod-tun`, `kmod-ipt-tproxy`, `ipset` 等核心代理组件。
- **系统工具**：
  - `curl`, `wget-ssl` (完整 HTTPS 支持)。
  - `ttyd` (网页终端), `sqm` (流量控制), `UPnP` (自动端口转发)。
  - `ip-full`, `net-tools` (常用网络调试工具)。

## GitHub Actions 动态编译
本项目支持在不修改代码的情况下，动态编译你需要的任何第三方插件：

1. 进入 Action 页面，选择 `Build NEWIFI3 openwrt firmware`。
2. 点击 `Run workflow`，在 `plugin_source` 中输入插件的 GitHub 仓库地址。
3. 编译完成后，所有的插件 `.ipk` 文件将作为 **Artifacts** 供单独下载，且保证与当前固件内核版本绝对匹配。

## 配置建议
1. **刷机建议**：由于集成了大量内核模块和新主题，强烈建议**不保留配置**刷机。
2. **时区与 NTP**：首次启动请手动修改时区（Asia/Shanghai）及 NTP 服务器。
3. **网桥配置**：接口 > 设备 > br-lan 需要手动添加无线适配器 `ra0`, `rai0` 到网桥（默认可能未桥接无线），否则 WiFi 设备无法访问 LAN。

## 更新日志
- 2026.05.06 集成全量依赖（MiniEAP, Argon, LeigodAcc 必备组件，全中文支持）。
- 2025.04.21 优化 LEDE/OpenWrt 官方源兼容性测试。
- 2025.04.20 使用官方源码 21.02.7 + 闭源无线驱动。

## Credits
- [P3TERX/Actions-OpenWrt](https://github.com/P3TERX/Actions-OpenWrt)
- [jerrykuku/luci-theme-argon](https://github.com/jerrykuku/luci-theme-argon)
- [kongfl888/luci-app-minieap](https://github.com/kongfl888/luci-app-minieap)

## License
[MIT](LICENSE) © [**P3TERX**](https://p3terx.com)
