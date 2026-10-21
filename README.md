# LanScope

SwiftUI + Network.framework 的 iOS 局域网主机发现原型。无后端、无第三方依赖。最低 iOS 17，使用 Xcode 15 或更新版本。

## 已实现

- 手动输入 IPv4 CIDR，自动归一化网段；支持私有地址和链路本地地址。
- 单次最多 1024 个地址（最宽 /22）；排除常规网段的网络地址和广播地址，正确处理 /31 和 /32。
- 仅走 Wi-Fi，同时最多 24 个 TCP 连接；每台主机依次尝试 80、443、22、445，单次超时 1.5 秒。
- TCP 连接成功或明确拒绝均记录为响应证据，收到首个响应后结束该 IP 的探测。
- 实时结果、数字 IP 排序、探测耗时、发现时间、进度和取消。
- 进入后台停止扫描；保留当前结果，重新扫描清空。
- 本地扫描历史：扫描完成或有进度的扫描中断后自动保存，保留最近 30 次；按今天、昨天、更早展示，支持查看单次结果及滑动删除。记录网段、起止时间、完成状态、进度、主机响应信息及诊断提示。
- 历史记录预留扫描时的 Wi-Fi 名称；当前尚未接入名称获取，缺失时隐藏，不使用查看历史时的网络信息回填。
- 局域网权限说明、网络错误提示、独立核心单元测试和 macOS CI。

## 在 Mac 上运行

1. 打开 `LanScope.xcodeproj`，选择 `LanScope` scheme。
2. 在 Signing & Capabilities 中确认 Team。当前 Bundle ID 为 `com.yoonzm.lanscope`，Team ID 为 `6F7QRYSM6W`。
3. 连接 iPhone，按 Xcode 提示启用开发者模式，选择真机并运行。
4. 将 iPhone 连接到测试 Wi-Fi。在系统 Wi-Fi 详情中查看地址和子网掩码，填写正确 CIDR，例如 `192.168.1.0/24`。
5. 开始扫描并允许局域网访问。首次权限弹窗可能超过探测超时；授权后再次开始即可。拒绝后可在系统设置中打开此 App 的局域网权限。

默认网段是示例，不会自动读取当前网络；不要直接假设本机网络为 /24。

## Windows 开发与云端构建

在 Windows 编辑源码即可。当前机器没有 Swift/Xcode，无法本地编译 iOS。

仓库内 `.github/workflows/ios.yml` 在推送到 GitHub 后，会使用 macOS runner：

1. 执行 `swift test`，测试 CIDR 解析和范围限制。
2. 使用 `xcodebuild` 编译未签名的 iOS Simulator 应用。

此工作流用于验证编译，**不会生成可安装到 iPhone 的 IPA，也不会自动发布**。构建状态请查看仓库的 [Actions 页面](https://github.com/yoonzm/LanScope/actions)。

### GitHub Actions TestFlight 发布（迁移中）

`.github/workflows/testflight.yml` 提供 macOS 上的测试、签名归档、IPA 导出与 App Store Connect 上传。仅允许 `main` 分支发布，不向 PR 提供签名材料。上传成功后由 Apple 处理，再交给已启用自动分发的内部测试组。IPA 和构建日志保留 7 天；临时钥匙串及密钥在任务结束时清理。

需要在仓库 Settings → Secrets and variables → Actions 配置：

| Secret | 内容 |
|---|---|
| `BUILD_CERTIFICATE_BASE64` | 含私钥的 Apple Distribution `.p12` 文件的 Base64 |
| `P12_PASSWORD` | `.p12` 导出密码 |
| `BUILD_PROVISION_PROFILE_BASE64` | 匹配 `com.yoonzm.lanscope` 的 App Store `.mobileprovision` 的 Base64 |
| `ASC_KEY_ID` | App Store Connect 团队 API 密钥 ID |
| `ASC_ISSUER_ID` | API Issuer ID |
| `ASC_PRIVATE_KEY` | `.p8` 私钥原文（保留换行） |

先手动运行 `TestFlight` 工作流验证签名与上传。确认成功后，移除 `codemagic.yaml` 的 `triggering` 配置，并将仓库变量 `TESTFLIGHT_PUBLISHING_ENABLED` 设置为 `true`，切换为推送 `main` 自动发布。在完成切换前，Codemagic 继续自动打包，GitHub 发布仅支持手动启动。

GitHub 构建号采用 `(1000 + GITHUB_RUN_NUMBER).GITHUB_RUN_ATTEMPT`，与现有 Codemagic 构建号错开，并为重试生成新构建号。迁移后不要再用 Codemagic 的低构建号上传相同版本。`ITSAppUsesNonExemptEncryption=false` 已写入 Info.plist，与当前应用实现一致；若以后加入新的加密功能，应重新评估该声明。

根目录 `codemagic.yaml` 提供 `ios-testflight` 工作流。需要在 Codemagic 添加名称为 `LanScope` 的 Apple Developer Portal 集成，并添加匹配 `com.yoonzm.lanscope` 的 Apple Distribution 证书（含私钥）和 App Store 描述文件。

推送到 `main` 分支会自动触发此工作流；连续推送会取消同分支旧的排队或运行中构建。其他分支不自动触发签名打包，仍可手动启动。仅在本地执行 `git commit` 不会触发云端构建，需要 `git push origin main`。

自动触发还依赖 GitHub 与 Codemagic 的 Webhook：在 Codemagic 应用的 Webhooks 页面检查配置和投递记录，必要时由添加仓库的团队管理员使用 Update webhook。若推送后没有构建，先检查 Webhook 是否收到 push 事件。配置说明见 [Codemagic 自动构建文档](https://docs.codemagic.io/yaml-running-builds/starting-builds-automatically/)。

工作流运行核心测试、递增构建号、签名导出 IPA 并上传 App Store Connect。导出限制为 TestFlight 内部测试，不提交外部测试审核或 App Store 审核。首次上传处理完成后，在 App Store Connect 手动分配构建给内部测试组。App Store 类型的 IPA 不可直接通过“文件”App 安装。

已有不透明的 1024×1024 测试版图标。不要把证书、私钥或 API key 提交进仓库。构建号使用 Codemagic 的 `BUILD_NUMBER + 1`；若更换构建平台或重建 Codemagic 应用，请确保构建号高于已上传的版本。

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
| `LanScope/Scanner.swift` | 独立串行队列管理连接、超时、取消与结果 |
| `LanScope/ScanViewModel.swift` | 主线程 UI 状态、会话隔离 |
| `LanScope/ContentView.swift` | SwiftUI 界面 |
| `LanScope/Info.plist` | 局域网权限用途 |
| `Tests/IPv4RangeTests.swift` | 可通过 Swift Package 执行的核心测试 |

## 结果解释与边界

- 未响应不代表离线。设备可能过滤这些端口、休眠或处于 AP 隔离网络。
- 连接拒绝说明有响应证据，但响应也可能来自防火墙等中间设备。
- 显示时间是该次 TCP 连接/拒绝耗时，不是 ping RTT。
- 端口是本次发现的依据，不是完整端口清单。
- `.waiting` 表示等待网络路径，不直接认定权限被拒绝。等待至期限后结束扫描并提示检查网络和权限。
- Wi-Fi 断开通常会导致路径错误并停止；本版未实现 Wi-Fi 切换识别或自动更新目标网段。更换网络后请停止并重新输入范围。
- 仅使用 TCP，不发送应用层请求，不包含 mDNS、ICMP、ARP、MAC/厂商识别或完整拓扑。
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

上述真机步骤和 macOS 编译尚未在当前 Windows 环境执行。
