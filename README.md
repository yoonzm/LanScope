# 汽美管家（Flutter 前端原型）

汽车美容门店管理 App 的前端实现，目前**仅使用 mock 数据**，无后端。UI 来自设计稿。

> 本分支（`claude/sleepy-clarke-4ehenr`）只用于该 App，与 `main` 上的 LanScope 网络扫描 App 无关。

## 已实现页面
登录 · 首页工作台 · 会员列表（搜索/筛选）· 会员详情 · 库存 · 营业统计 · 开单收银（含次卡抵扣/会员折扣计算）·
预约管理（列表/工位时间表）· 新建预约 · 我的/设置 · 服务项目与价格。
其余页面入口暂以占位页代替。

## 运行
```bash
flutter pub get
flutter run
flutter test
```

## 自动打包（iOS + Android）
推送到本分支会触发 `.github/workflows/ios.yml`（沿用原文件名以保持构建号连续）：iOS 签名归档并上传 TestFlight；Android 产出 release APK（Actions 产物 `Qimei-Android-*`，使用 Flutter 默认调试签名，仅供内测安装）。
暂沿用 `com.yoonzm.lanscope` 的 Bundle ID 与仓库已有签名 secrets，版本号 `1.0.0`，构建号为 workflow 运行序号。
