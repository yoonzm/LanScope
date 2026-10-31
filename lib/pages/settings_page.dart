import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/common.dart';
import 'login_page.dart';
import 'services_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          const SubHeader('我的'),
          Expanded(
            child: ListView(padding: const EdgeInsets.fromLTRB(20, 8, 20, 32), children: [
              _profile(),
              const SizedBox(height: 20),
              _group(context, '门店管理', [
                _Item(Icons.storefront_outlined, '门店信息', '地址 · 电话 · 营业执照'),
                _Item(Icons.badge_outlined, '员工与权限', '8 人'),
                _Item(Icons.cleaning_services_outlined, '服务项目与价格', '36 项', page: const ServicesPage()),
                _Item(Icons.workspace_premium_outlined, '会员卡种与权益', '4 种'),
              ]),
              const SizedBox(height: 20),
              _group(context, '营业设置', [
                _Item(Icons.verified_outlined, '套餐与订阅', '专业版 · 365 天后到期'),
                _Item(Icons.account_balance_wallet_outlined, '支付与收款', '微信 · 支付宝 · 储值'),
                _Item(Icons.print_outlined, '小票打印机', '已连接'),
                _Item(Icons.schedule_outlined, '营业时间与工位', '09:00–20:00 · 6 工位'),
                _Item(Icons.notifications_none_rounded, '通知与消息', '会员消费充值 · 微信 / 短信'),
              ]),
              const SizedBox(height: 20),
              _group(context, '通用', [
                _Item(Icons.lock_outline_rounded, '账号与安全', '密码 · 登录设备'),
                _Item(Icons.contrast_rounded, '外观', '跟随系统'),
                _Item(Icons.cleaning_services_rounded, '清除缓存', '128 MB'),
                _Item(Icons.info_outline_rounded, '关于汽美管家', 'v1.0.0'),
              ]),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const LoginPage()), (_) => false),
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(25), boxShadow: softShadow),
                  child: Text('退出登录', style: ts(16, w: FontWeight.w600, color: C.redInk, h: 24)),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }

  Widget _profile() => Container(
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: C.ink, borderRadius: BorderRadius.circular(28)),
        child: Stack(clipBehavior: Clip.hardEdge, children: [
          const Positioned(right: -90, top: -100, child: Rings(size: 220)),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              const Avatar('陈', size: 56, bg: C.primary, fg: Colors.white),
              const SizedBox(width: 14),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    Text('陈明', style: ts(18, w: FontWeight.w600, color: const Color(0xFFFAFAFA), h: 26)),
                    const SizedBox(width: 8),
                    Pill('店长', bg: C.gold, fg: C.ink, size: 11),
                  ]),
                  Text('139 **** 8812', style: ts(13, color: C.faint, h: 18)),
                ]),
              ),
            ]),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.only(top: 14),
              decoration: const BoxDecoration(border: Border(top: BorderSide(color: Color(0xFF2E2E33)))),
              child: Row(children: [
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('驰光汽车美容 · 徐汇店',
                        style: ts(14, w: FontWeight.w500, color: const Color(0xFFFAFAFA), h: 20)),
                    Text('专业版 · 2027.10.30 到期', style: ts(12, color: C.faint, h: 16)),
                  ]),
                ),
                Container(
                  height: 32,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: C.dark2, borderRadius: BorderRadius.circular(16)),
                  child: Text('切换门店',
                      style: ts(13, w: FontWeight.w500, color: const Color(0xFFFAFAFA), h: 18)),
                ),
              ]),
            ),
          ]),
        ]),
      );

  Widget _group(BuildContext context, String title, List<_Item> items) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 10),
            child: Text(title, style: ts(13, w: FontWeight.w500, color: C.muted, h: 18)),
          ),
          AppCard(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Column(children: [
              for (var i = 0; i < items.length; i++) ...[
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => push(context, items[i].page ?? PlaceholderPage(items[i].title)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                    child: Row(children: [
                      Icon(items[i].icon, size: 20, color: C.sub),
                      const SizedBox(width: 12),
                      Text(items[i].title, style: ts(15, w: FontWeight.w500, h: 22)),
                      const SizedBox(width: 8),
                      Expanded(
                          child: Text(items[i].sub,
                              textAlign: TextAlign.right,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: ts(12, color: C.muted, h: 16))),
                      const SizedBox(width: 4),
                      const Icon(Icons.chevron_right_rounded, size: 18, color: C.faint),
                    ]),
                  ),
                ),
                if (i < items.length - 1) const Divider1(indent: 48),
              ],
            ]),
          ),
        ],
      );
}

class _Item {
  final IconData icon;
  final String title, sub;
  final Widget? page;
  _Item(this.icon, this.title, this.sub, {this.page});
}
