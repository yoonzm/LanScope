import 'package:flutter/material.dart';

import '../theme.dart';
import '../mock/app_state.dart';
import '../routes.dart';
import '../widgets/app_icon.dart';
import '../widgets/common.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SubHeader('我的'),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                children: [
                  _profile(),
                  const SizedBox(height: 20),
                  _group(context, '门店管理', [
                    _Item(
                      'store',
                      '门店信息',
                      '地址 · 电话 · 营业执照',
                      route: 'StoreInfo',
                    ),
                    _Item('users', '员工与权限', '8 人', route: 'Staff'),
                    _Item('sparkle', '服务项目与价格', '36 项', route: 'Services'),
                    _Item('card', '会员卡种与权益', '4 种', route: 'CardTiers'),
                  ]),
                  const SizedBox(height: 20),
                  _group(context, '营业设置', [
                    _Item(
                      'crown',
                      '套餐与订阅',
                      '专业版 · 365 天后到期',
                      route: 'Subscription',
                    ),
                    _Item('card2', '支付与收款', '微信 · 支付宝 · 储值'),
                    _Item('printer', '小票打印机', '已连接'),
                    _Item('clock', '营业时间与工位', '09:00–20:00 · 6 工位'),
                    _Item(
                      'bell',
                      '通知与消息',
                      '会员消费充值 · 微信 / 短信',
                      route: 'NotifySettings',
                    ),
                  ]),
                  const SizedBox(height: 20),
                  _group(context, '通用', [
                    _Item('shield', '账号与安全', '密码 · 登录设备'),
                    _Item('moon', '外观', '跟随系统'),
                    _Item('trash', '清除缓存', '128 MB'),
                    _Item('info', '关于汽美管家', 'v1.0.0'),
                  ]),
                  const SizedBox(height: 24),
                  GestureDetector(
                    onTap: () => openRoute(context, 'Login'),
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: softShadow,
                      ),
                      child: Text(
                        '退出登录',
                        style: ts(
                          16,
                          w: FontWeight.w600,
                          color: C.redInk,
                          h: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 演示用：切换订阅状态，查看首页在不同状态下的呈现。
  void _demoSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
          child: ValueListenableBuilder<SubState>(
            valueListenable: subState,
            builder: (_, cur, _) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('汽美管家 v1.0.0', style: ts(17, w: FontWeight.w600, h: 24)),
                const SizedBox(height: 4),
                Text(
                  '演示：切换套餐状态，首页会显示对应的提醒或到期页',
                  style: ts(12, color: C.muted, h: 16),
                ),
                const SizedBox(height: 12),
                for (final st in SubState.values)
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      subState.value = st;
                      Navigator.of(ctx).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              subStateLabels[st]!,
                              style: ts(15, h: 22),
                            ),
                          ),
                          if (cur == st)
                            const AppIcon(
                              'check',
                              size: 18,
                              color: C.primary,
                              stroke: 2.6,
                            ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _open(BuildContext context, _Item item) {
    if (item.title.startsWith('关于')) {
      _demoSheet(context);
    } else if (item.route != null) {
      openRoute(context, item.route!);
    } else {
      toast(context, '${item.title}（演示）');
    }
  }

  Widget _profile() => Container(
    clipBehavior: Clip.antiAlias,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: C.ink,
      borderRadius: BorderRadius.circular(28),
    ),
    child: Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        const Positioned(right: -90, top: -100, child: Rings(size: 220)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Avatar('陈', size: 56, bg: C.primary, fg: Colors.white),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '陈明',
                            style: ts(
                              18,
                              w: FontWeight.w600,
                              color: const Color(0xFFFAFAFA),
                              h: 26,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Pill('店长', bg: C.gold, fg: C.ink, size: 11),
                        ],
                      ),
                      Text(
                        '139 **** 8812',
                        style: ts(13, color: C.faint, h: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.only(top: 14),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Color(0xFF2E2E33))),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '驰光汽车美容 · 徐汇店',
                          style: ts(
                            14,
                            w: FontWeight.w500,
                            color: const Color(0xFFFAFAFA),
                            h: 20,
                          ),
                        ),
                        Text(
                          '专业版 · 2027.10.30 到期',
                          style: ts(12, color: C.faint, h: 16),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 32,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: C.dark2,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      '切换门店',
                      style: ts(
                        13,
                        w: FontWeight.w500,
                        color: const Color(0xFFFAFAFA),
                        h: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );

  Widget _group(BuildContext context, String title, List<_Item> items) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 10),
            child: Text(
              title,
              style: ts(13, w: FontWeight.w500, color: C.muted, h: 18),
            ),
          ),
          AppCard(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Column(
              children: [
                for (var i = 0; i < items.length; i++) ...[
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => _open(context, items[i]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 13,
                      ),
                      child: Row(
                        children: [
                          AppIcon(items[i].icon, size: 20, color: C.sub),
                          const SizedBox(width: 12),
                          Text(
                            items[i].title,
                            style: ts(15, w: FontWeight.w500, h: 22),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              items[i].sub,
                              textAlign: TextAlign.right,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: ts(12, color: C.muted, h: 16),
                            ),
                          ),
                          const SizedBox(width: 4),
                          AppIcon('chevronRight', size: 18, color: C.faint),
                        ],
                      ),
                    ),
                  ),
                  if (i < items.length - 1) const Divider1(indent: 48),
                ],
              ],
            ),
          ),
        ],
      );
}

class _Item {
  final String icon;
  final String title, sub;
  final String? route;
  _Item(this.icon, this.title, this.sub, {this.route});
}
