import 'package:flutter/material.dart';
import '../mock/mock_data.dart';
import '../theme.dart';
import '../widgets/common.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});
  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  int range = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).padding.top + 12, 20, 24),
        children: [
          Row(children: [
            Expanded(child: Text('营业统计', style: ts(28, w: FontWeight.w600, h: 36, spacing: -0.7))),
            _pill(context, '开支', Icons.receipt_long_outlined),
            const SizedBox(width: 8),
            _pill(context, '导出', Icons.ios_share_rounded),
          ]),
          const SizedBox(height: 16),
          Segmented(
              labels: const ['今日', '本周', '本月', '自定义'],
              selected: range,
              onChanged: (i) => setState(() => range = i)),
          const SizedBox(height: 16),
          _chartCard(),
          const SizedBox(height: 16),
          _composition(),
          const SizedBox(height: 16),
          Row(children: [
            Expanded(child: _mini('施工台次', '912', null, C.primarySoft, C.primaryInk, Icons.build_circle_outlined)),
            const SizedBox(width: 10),
            Expanded(child: _mini('会员消费占比', '71%', null, C.greenSoft, C.greenInk, Icons.groups_outlined)),
          ]),
        ],
      ),
    );
  }

  Widget _pill(BuildContext context, String t, IconData i) => GestureDetector(
        onTap: () => push(context, PlaceholderPage(t)),
        child: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: softShadow),
          child: Row(children: [
            Icon(i, size: 16, color: C.ink),
            const SizedBox(width: 6),
            Text(t, style: ts(13, w: FontWeight.w500, h: 18)),
          ]),
        ),
      );

  Widget _chartCard() {
    final maxV = monthDaily.reduce((a, b) => a > b ? a : b);
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: C.ink, borderRadius: BorderRadius.circular(28)),
      child: Stack(clipBehavior: Clip.hardEdge, children: [
        const Positioned(right: -90, top: -100, child: Rings(size: 220)),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('10 月营业额（元）', style: ts(13, color: C.faint, h: 18)),
          const SizedBox(height: 4),
          Text('328,460',
              style: ts(34, w: FontWeight.w600, color: const Color(0xFFFAFAFA), h: 40, spacing: -1, tabular: true)),
          const SizedBox(height: 4),
          Row(children: [
            const Icon(Icons.trending_up_rounded, size: 14, color: Color(0xFF4ADE80)),
            const SizedBox(width: 4),
            Text('环比 +12.6%',
                style: ts(12, w: FontWeight.w500, color: const Color(0xFF4ADE80), h: 16)),
          ]),
          const SizedBox(height: 20),
          SizedBox(
            height: 110,
            child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              for (var i = 0; i < monthDaily.length; i++)
                Expanded(
                  child: Container(
                    height: 110 * monthDaily[i] / maxV,
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    decoration: BoxDecoration(
                        color: i == monthDaily.length - 1 ? C.primary : const Color(0xFF3F3F46),
                        borderRadius: BorderRadius.circular(3)),
                  ),
                ),
            ]),
          ),
          const SizedBox(height: 8),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('10.01', style: ts(11, color: C.faint, h: 14)),
            Text('10.31', style: ts(11, color: C.faint, h: 14)),
          ]),
        ]),
      ]),
    );
  }

  Widget _composition() {
    const colors = [C.ink, C.primary, Color(0xFF7CC4FB), Color(0xFFD4D4D8)];
    return AppCard(
      padding: const EdgeInsets.all(18),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('项目收入构成', style: ts(15, w: FontWeight.w600, h: 22)),
        const SizedBox(height: 14),
        for (var i = 0; i < revenueShares.length; i++) ...[
          Row(children: [
            Container(width: 8, height: 8, decoration: BoxDecoration(color: colors[i], shape: BoxShape.circle)),
            const SizedBox(width: 8),
            Expanded(child: Text(revenueShares[i].name, style: ts(14, h: 20))),
            Text('${revenueShares[i].percent}%', style: ts(14, w: FontWeight.w600, h: 20)),
            SizedBox(
                width: 84,
                child: Text('¥${money(revenueShares[i].amount)}',
                    textAlign: TextAlign.right, style: ts(13, color: C.muted, h: 18, tabular: true))),
          ]),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: LinearProgressIndicator(
                value: revenueShares[i].percent / 100,
                minHeight: 6,
                backgroundColor: C.chip,
                valueColor: AlwaysStoppedAnimation(colors[i])),
          ),
          if (i < revenueShares.length - 1) const SizedBox(height: 14),
        ],
      ]),
    );
  }

  Widget _mini(String label, String value, String? note, Color bg, Color fg, IconData icon) =>
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(24)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(icon, size: 20, color: fg),
          const SizedBox(height: 14),
          Text(value, style: ts(26, w: FontWeight.w600, color: fg, h: 32, tabular: true)),
          Text(label, style: ts(12, color: fg.withValues(alpha: 0.8), h: 16)),
        ]),
      );
}
