import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets/app_icon.dart';
import '../widgets/common.dart';
import 'home_page.dart';
import 'inventory_page.dart';
import 'members_page.dart';
import '../mock/app_state.dart';
import '../routes.dart';
import 'gen/plan_expired_page.dart';
import 'order_page.dart';
import 'stats_page.dart';

/// 全局切换底部 Tab 的入口（首页快捷入口使用）
final ValueNotifier<int> tabIndex = ValueNotifier<int>(0);

class Shell extends StatefulWidget {
  const Shell({super.key});

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  @override
  void initState() {
    super.initState();
    shellMounted = true;
  }

  @override
  void dispose() {
    shellMounted = false;
    super.dispose();
  }

  static const _pages = <Widget>[
    HomePage(),
    MembersPage(),
    InventoryPage(),
    StatsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<SubState>(
      valueListenable: subState,
      builder: (context, st, _) =>
          st == SubState.expired ? const PlanExpiredPage() : _tabs(context),
    );
  }

  Widget _tabs(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: tabIndex,
      builder: (context, idx, _) => Scaffold(
        body: IndexedStack(index: idx, children: _pages),
        bottomNavigationBar: _BottomBar(
          index: idx,
          onTab: (i) => tabIndex.value = i,
          onOrder: () => push(context, const OrderPage()),
        ),
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onTab;
  final VoidCallback onOrder;
  const _BottomBar({
    required this.index,
    required this.onTab,
    required this.onOrder,
  });

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).padding.bottom;
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: bottom > 0 ? bottom : 12),
      decoration: BoxDecoration(
        color: C.card,
        boxShadow: [
          BoxShadow(color: C.line, offset: const Offset(0, -1)),
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 24,
            offset: Offset(0, -8),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _item(0, 'home', 'home', '首页'),
          _item(1, 'users', 'usersActive', '会员'),
          Expanded(
            child: GestureDetector(
              onTap: onOrder,
              behavior: HitTestBehavior.opaque,
              child: Transform.translate(
                offset: const Offset(0, -22),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        color: C.btn,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: C.card, spreadRadius: 5),
                          BoxShadow(
                            color: Color(0x4018181B),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: AppIcon('add', color: C.btnFg, size: 26),
                    ),
                    const SizedBox(height: 4),
                    Text('开单', style: ts(11, w: FontWeight.w500, h: 14)),
                  ],
                ),
              ),
            ),
          ),
          _item(2, 'box', 'boxActive', '库存'),
          _item(3, 'chart', 'chart', '统计'),
        ],
      ),
    );
  }

  Widget _item(int i, String off, String on, String label) {
    final sel = index == i;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTab(i),
        child: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppIcon(
                sel ? on : off,
                size: 24,
                color: sel ? C.primary : C.muted,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: ts(
                  11,
                  w: sel ? FontWeight.w600 : FontWeight.w500,
                  color: sel ? C.ink : C.muted,
                  h: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
