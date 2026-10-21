# LanScope

SwiftUI + Network.framework 的 iOS 局域网主机发现原型。无后端、无第三方依赖。最低 iOS 17，使用 Xcode 15 或更新版本。

## 已实现

- 每次启动 App 创建扫描页面时，自动识别一次当前 Wi-Fi 的 IPv4 地址和实际子网掩码，填入对应 CIDR；用户可直接修改输入框，无需切换模式。支持私有地址和链路本地地址。
- 单次最多 1024 个地址（最宽 /22）；排除常规网段的网络地址和广播地址，正确处理 /31 和 /32。
- 扫描目标下方提供“高级设置”弹窗，默认开启“只扫描 ping 成功的设备”；可自定义 TCP 端口（默认 80、443、22、445），以逗号或空格分隔，范围 1–65535，自动去重。点击保存后通过 UserDefaults 持久化到本机，取消不保存。
- 仅走 Wi-Fi，同时最多处理 24 个地址，每个地址串行探测；ICMP 和单个 TCP 端口的超时均为 1.5 秒。默认先发一次 ICMP Echo，只对收到匹配 Echo Reply 的地址检查全部指定 TCP 端口；无回应直接跳过 TCP。关闭 ping 筛选后直接对全部地址检查指定 TCP 端口。
- Ping 成功或 TCP 连接成功/明确拒绝均记录为响应证据。Ping 成功的设备即使所有端口未响应也会展示；逐端口显示开放、拒绝连接、未响应或错误，分别标注 Ping 与 TCP 耗时。
- 实时结果、数字 IP 排序、探测耗时、发现时间、进度和取消。
- 进入后台停止扫描；保留当前结果，重新扫描清空。
- 本地扫描历史：扫描完成或已有进度/发现主机的扫描中断后自动保存，保留最近 30 次；按今天、昨天、更早展示，支持查看单次结果及滑动删除。记录网段、起止时间、完成状态、进度、主机响应信息、诊断提示及当次扫描设置；兼容旧版历史。
- 历史记录预留扫描时的 Wi-Fi 名称；当前尚未接入名称获取，缺失时隐藏，不使用查看历史时的网络信息回填。
- 局域网权限说明、网络错误提示、独立核心单元测试和 macOS CI。

## 在 Mac 上运行

1. 打开 `LanScope.xcodeproj`，选择 `LanScope` scheme。
2. 在 Signing & Capabilities 中确认 Team。当前 Bundle ID 为 `com.yoonzm.lanscope`，Team ID 为 `6F7QRYSM6W`。
3. 连接 iPhone，按 Xcode 提示启用开发者模式，选择真机并运行。
4. 将 iPhone 连接到测试 Wi-Fi，打开 App 后等待自动填入网段；需要指定范围时，直接编辑 CIDR，例如 `192.168.1.0/24`。
5. 开始扫描并允许局域网访问。首次权限弹窗可能超过探测超时；授权后再次开始即可。拒绝后可在系统设置中打开此 App 的局域网权限。

自动识别使用 Network.framework 提供的 Wi-Fi 接口名称，配合 `getifaddrs` 读取 IPv4 地址及掩码，不假定 /24，也不使用蜂窝或 VPN 接口地址。没有可用 IPv4 或出现多个候选地址时提示手动输入，不回退到示例网段。识别到 /16 等大网段时展示真实范围，但保留最多 1024 个地址的扫描限制，需手动缩小范围。自动识别只填写范围，用户点击“开始扫描”后才发起探测。

## Windows 开发与云端构建

在 Windows 编辑源码即可。当前机器没有 Swift/Xcode，无法本地编译 iOS。

云端统一使用 TestFlight 工作流执行单元测试、Release 构建和发布，不再单独运行 Build 工作流。非 `main` 分支推送和 PR 不自动触发检查；模拟器编译可在 Mac 上使用下方命令执行。运行状态请查看仓库的 [Actions 页面](https://github.com/yoonzm/LanScope/actions)。

### GitHub Actions TestFlight 发布

`.github/workflows/testflight.yml` 在推送 `main` 时自动执行，也支持手动启动。工作流在 macOS 上选择稳定版 Xcode 26 或更新版本，检查 iOS SDK 至少为 26，然后测试、签名归档、导出 IPA 并上传 App Store Connect。仅允许 `main` 分支发布，不向 PR 提供签名材料。上传成功后由 Apple 处理，再交给已启用自动分发的“个人设备自动测试”内部组。IPA 和构建日志保留 7 天；临时钥匙串及密钥在任务结束时清理。

需要在仓库 Settings → Secrets and variables → Actions 配置：

| Secret | 内容 |
|---|---|
| `BUILD_CERTIFICATE_BASE64` | 含私钥的 Apple Distribution `.p12` 文件的 Base64 |
| `P12_PASSWORD` | `.p12` 导出密码 |
| `BUILD_PROVISION_PROFILE_BASE64` | 匹配 `com.yoonzm.lanscope` 的 App Store `.mobileprovision` 的 Base64 |
| `ASC_KEY_ID` | App Store Connect 团队 API 密钥 ID |
| `ASC_ISSUER_ID` | API Issuer ID |
| `ASC_PRIVATE_KEY` | `.p8` 私钥原文（保留换行） |

上述 Secrets 已配置。发布流程串行执行，避免同时上传；失败时可以在 Actions 页面重试。可在仓库 Actions 页的 `TestFlight` 工作流中下载 IPA 或查看上传结果。

GitHub 构建号采用 `(1000 + GITHUB_RUN_NUMBER).GITHUB_RUN_ATTEMPT`，与历史构建号错开，并为重试生成新构建号。`ITSAppUsesNonExemptEncryption=false` 已写入 Info.plist，与当前应用实现一致；若以后加入新的加密功能，应重新评估该声明。

导出限制为 TestFlight 内部测试，不提交外部测试审核或 App Store 审核。App Store 类型的 IPA 不可直接通过“文件”App 安装。不要把证书、私钥或 API key 提交进仓库。

Mac 本地验证命令：

```sh
swift test
xcodebuild -project LanScope.xcodeproj -scheme LanScope \
  -configuration Debug -sdk iphonesimulator \
  -destination 'generic/platform=iOS Simulator' \
  -derivedDataPath build CODE_SIGNING_ALLOWED=NO build
```

## 文件结构

| 路径 | 用途 |
|---|---|
| `Core/IPv4Range.swift` | CIDR 校验、归一化、地址枚举 |
| `LanScope/WiFiNetwork.swift` | 读取 Wi-Fi 接口的 IPv4 地址及掩码 |
| `Core/ScanSettings.swift` | 端口校验、扫描设置及本机持久化 |
| `Core/ICMPPacket.swift` | ICMP 校验和、请求生成和回应匹配 |
| `LanScope/PingProbe.swift` | 绑定 Wi-Fi 接口的 ICMP 数据报探测、超时与取消 |
| `LanScope/AdvancedSettingsView.swift` | 高级设置弹窗 |
| `LanScope/Scanner.swift` | 独立串行队列管理连接、超时、取消与结果 |
| `LanScope/ScanViewModel.swift` | 主线程 UI 状态、会话隔离 |
| `LanScope/ContentView.swift` | SwiftUI 界面 |
| `LanScope/Info.plist` | 局域网权限用途 |
| `Tests/IPv4RangeTests.swift` | 可通过 Swift Package 执行的核心测试 |

## 结果解释与边界

- 未响应不代表离线。设备可能过滤这些端口、休眠或处于 AP 隔离网络。
- 连接拒绝说明有响应证据，但响应也可能来自防火墙等中间设备。
- Ping 时间为收到 Echo Reply 的往返耗时；每个 TCP 端口单独显示该次连接尝试耗时，两者不能混用。
- 只探测用户指定的 TCP 端口，未扫描端口的状态未知；未响应不能直接判定端口关闭。
- 默认 ping 筛选会漏掉不回应 ICMP 的在线设备，可在高级设置中关闭。ICMP 不可用时明确报错，不静默退回 TCP；首次本地网络授权可能超过 ping 时限，允许后应重新扫描。
- `.waiting` 表示等待网络路径，不直接认定权限被拒绝。等待至期限后结束扫描并提示检查网络和权限。
- 自动识别仅在扫描页面初始化时尝试一次，不提供重新识别按钮；回到前台、网络变化及开始扫描时均不覆盖输入。识别完成前用户已编辑（包括输入后清空）的内容也会保留。更换 Wi-Fi 后需自行确认并修改范围；本版不主动识别 Wi-Fi 切换，断开网络可能由扫描连接的路径错误触发停止。
- 使用 ICMP 数据报套接字和 TCP，不发送应用层请求，不包含 mDNS、主动 ARP 扫描、MAC/厂商识别或完整拓扑。Ping 校验来源 IP、标识、序列号、随机负载及校验和，避免并发请求间串包。
- 不保证后台持续扫描，不启用背景模式。
- Simulator 编译只能验证代码；发现率、权限、Wi-Fi 路径必须真机测试。

## 真机验收

1. 在已知开放 80/443/22/445 之一的设备上验证“连接成功”。
2. 对明确拒绝连接的地址验证“有响应证据”。
3. 对不响应的测试地址验证扫描结束且不产生在线误报。
4. 扫描中停止、立刻再次开始，确认旧结果不进入新会话。
5. 拒绝局域网权限、关闭 Wi-Fi，确认出现错误提示而不是“全部离线”。
6. 扫描中切到后台，确认扫描停止；回到前台可以重新开始。
7. 输入非法地址、公共地址或 /16，确认在发起连接前拒绝。
8. 分别在 /24 和非 /24（如 /23）的 Wi-Fi 下，对照系统地址与掩码验证自动网段；在 /16 下确认展示真实范围并提示手动缩小。
9. 直接修改自动填入的网段，确认重新进入前台、切换 Wi-Fi 和开始扫描不会覆盖输入，扫描及历史使用修改后的范围。
10. 在首次识别完成前输入或输入后清空网段，确认迟到的识别结果不会覆盖用户操作；终止并重新启动 App 后会重新尝试初始识别。
11. 无 Wi-Fi、仅蜂窝或仅 IPv6 时确认识别失败提示，不使用旧网段或示例网段。
12. 默认设置下，对可 ping 和禁止 ping（但 TCP 可访问）的设备抓包，确认只有前者收到指定端口的 TCP 探测；关闭筛选后两者均收到 TCP 探测。
13. 对 ping 成功但 TCP 全部未响应的设备确认仍显示主机和各端口结果；对多个开放端口的设备确认全部指定端口均被检查。
14. 保存自定义端口及筛选开关，终止并重启 App，确认设置保留；取消修改不保存；空列表、0、65536、非数字输入应报错，重复端口只检查一次。
15. 在 ping 和 TCP 阶段分别取消/切后台，确认探测停止；立即重新扫描，不应混入旧回调。历史应保留当次设置和已获得的部分结果。

上述真机步骤和 macOS 编译尚未在当前 Windows 环境执行。
