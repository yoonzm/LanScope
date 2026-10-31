import 'package:flutter/material.dart';

import '../mock/mock_data.dart';
import '../theme.dart';
import '../routes.dart';
import '../widgets/app_icon.dart';
import '../widgets/common.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});
  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _RangeData {
  final String title, total, delta, from, to, orders, memberShare;
  final int totalNum;
  final List<double> bars;
  const _RangeData(
    this.title,
    this.total,
    this.totalNum,
    this.delta,
    this.bars,
    this.from,
    this.to,
    this.orders,
    this.memberShare,
  );
}

const _ranges = <_RangeData>[
  _RangeData(
    '今日营业额（元）',
    '12,860',
    12860,
    '较上周六 +18.4%',
    [0.4, 0.9, 1.6, 2.1, 1.4, 1.1, 1.9, 2.4, 1.7, 1.2, 0.8, 0.3],
    '08:00',
    '20:00',
    '36',
    '68%',
  ),
  _RangeData(
    '本周营业额（元）',
    '71,280',
    71280,
    '较上周 +9.2%',
    [9.2, 10.4, 8.8, 11.6, 12.3, 14.1, 12.9],
    '周一',
    '周日',
    '198',
    '70%',
  ),
  _RangeData(
    '10 月营业额（元）',
    '328,460',
    328460,
    '环比 +12.6%',
    monthDaily,
    '10.01',
    '10.31',
    '912',
    '71%',
  ),
  _RangeData(
    '10.01 – 10.15 营业额（元）',
    '158,920',
    158920,
    '较上期 +6.3%',
    [
      7.2,
      8.1,
      6.4,
      9.8,
      10.5,
      12.9,
      8.6,
      9.2,
      10.1,
      11.4,
      9.7,
      13.2,
      14.8,
      10.3,
      9.1,
    ],
    '10.01',
    '10.15',
    '441',
    '69%',
  ),
];

class _StatsPageState extends State<StatsPage> {
  int range = 2;
  _RangeData get r => _ranges[range];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.fromLTRB(
          20,
          MediaQuery.of(context).padding.top + 12,
          20,
          24,
        ),
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '营业统计',
                  style: ts(28, w: FontWeight.w600, h: 36, spacing: -0.7),
                ),
              ),
              _pill(context, '开支', null),
              const SizedBox(width: 8),
              _pill(context, '导出', 'download'),
            ],
          ),
          const SizedBox(height: 16),
          Segmented(
            labels: const ['今日', '本周', '本月', '自定义'],
            selected: range,
            onChanged: (i) => setState(() => range = i),
          ),
          const SizedBox(height: 16),
          _chartCard(),
          const SizedBox(height: 16),
          _composition(),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _mini(
                  '施工台次',
                  r.orders,
                  null,
                  C.primarySoft,
                  C.primaryInk,
                  'car2',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _mini(
                  '会员消费占比',
                  r.memberShare,
                  null,
                  C.greenSoft,
                  C.greenInk,
                  'users',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _pill(BuildContext context, String t, String? i) => GestureDetector(
    onTap: () =>
        t == '开支' ? openRoute(context, 'Expenses') : toast(context, '已导出（演示）'),
    child: Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: softShadow,
      ),
      child: Row(
        children: [
          if (i != null) ...[
            AppIcon(i, size: 16, color: C.ink),
            const SizedBox(width: 6),
          ],
          Text(t, style: ts(13, w: FontWeight.w500, h: 18)),
        ],
      ),
    ),
  );

  Widget _chartCard() {
    final bars = r.bars;
    final maxV = bars.reduce((a, b) => a > b ? a : b);
    return Container(
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
              Text(r.title, style: ts(13, color: C.faint, h: 18)),
              const SizedBox(height: 4),
              Text(
                r.total,
                style: ts(
                  34,
                  w: FontWeight.w600,
                  color: const Color(0xFFFAFAFA),
                  h: 40,
                  spacing: -1,
                  tabular: true,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  AppIcon('trendUp', size: 14, color: Color(0xFF4ADE80)),
                  const SizedBox(width: 4),
                  Text(
                    r.delta,
                    style: ts(
                      12,
                      w: FontWeight.w500,
                      color: const Color(0xFF4ADE80),
                      h: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 110,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    for (var i = 0; i < bars.length; i++)
                      Expanded(
                        child: Container(
                          height: 110 * bars[i] / maxV,
                          margin: const EdgeInsets.symmetric(horizontal: 1),
                          decoration: BoxDecoration(
                            color: i == bars.length - 1
                                ? C.primary
                                : const Color(0xFF3F3F46),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(r.from, style: ts(11, color: C.faint, h: 14)),
                  Text(r.to, style: ts(11, color: C.faint, h: 14)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _composition() {
    const colors = [C.ink, C.primary, Color(0xFF7CC4FB), Color(0xFFD4D4D8)];
    return AppCard(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('项目收入构成', style: ts(15, w: FontWeight.w600, h: 22)),
          const SizedBox(height: 14),
          for (var i = 0; i < revenueShares.length; i++) ...[
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: colors[i],
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(revenueShares[i].name, style: ts(14, h: 20)),
                ),
                Text(
                  '${revenueShares[i].percent}%',
                  style: ts(14, w: FontWeight.w600, h: 20),
                ),
                SizedBox(
                  width: 84,
                  child: Text(
                    '¥${money(r.totalNum * revenueShares[i].percent ~/ 100)}',
                    textAlign: TextAlign.right,
                    style: ts(13, color: C.muted, h: 18, tabular: true),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: LinearProgressIndicator(
                value: revenueShares[i].percent / 100,
                minHeight: 6,
                backgroundColor: C.chip,
                valueColor: AlwaysStoppedAnimation(colors[i]),
              ),
            ),
            if (i < revenueShares.length - 1) const SizedBox(height: 14),
          ],
        ],
      ),
    );
  }

  Widget _mini(
    String label,
    String value,
    String? note,
    Color bg,
    Color fg,
    String icon,
  ) => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: bg,
      borderRadius: BorderRadius.circular(24),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppIcon(icon, size: 20, color: fg),
        const SizedBox(height: 14),
        Text(
          value,
          style: ts(26, w: FontWeight.w600, color: fg, h: 32, tabular: true),
        ),
        Text(label, style: ts(12, color: fg.withValues(alpha: 0.8), h: 16)),
      ],
    ),
  );
}
