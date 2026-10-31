import 'package:flutter/material.dart';
import '../mock/mock_data.dart';
import '../theme.dart';
import '../widgets/common.dart';
import 'member_detail_page.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({super.key});
  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  static const _filters = ['全部', '黑金卡 86', '金卡 312', '次卡将到期 18', '待回访 18'];
  static const _keys = [null, '黑金', '金卡', '次卡将到期', '待回访'];
  int filter = 0;
  String query = '';

  @override
  Widget build(BuildContext context) {
    final list = members.where((m) {
      final k = _keys[filter];
      if (k != null && !m.tags.contains(k)) return false;
      if (query.isEmpty) return true;
      return m.name.contains(query) || m.plate.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top + 12, 0, 24),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: [
              Expanded(child: Text('会员', style: ts(28, w: FontWeight.w600, h: 36, spacing: -0.7))),
              GestureDetector(
                onTap: () => push(context, const PlaceholderPage('新增会员')),
                child: Container(
                  height: 44,
                  padding: const EdgeInsets.fromLTRB(12, 0, 16, 0),
                  decoration: BoxDecoration(color: C.ink, borderRadius: BorderRadius.circular(22)),
                  child: Row(children: [
                    const Icon(Icons.add_rounded, size: 18, color: Colors.white),
                    const SizedBox(width: 6),
                    Text('新增会员', style: ts(14, w: FontWeight.w500, color: Colors.white, h: 20)),
                  ]),
                ),
              ),
            ]),
          ),
          const SizedBox(height: 16),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: _summary()),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(22), boxShadow: softShadow),
              child: Row(children: [
                const Icon(Icons.search_rounded, size: 20, color: C.muted),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    onChanged: (v) => setState(() => query = v.trim()),
                    style: ts(14),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        isCollapsed: true,
                        hintText: '搜索会员 / 车牌 / 手机号',
                        hintStyle: ts(14, color: C.muted)),
                  ),
                ),
              ]),
            ),
          ),
          const SizedBox(height: 12),
          ChipTabs(labels: _filters, selected: filter, onChanged: (i) => setState(() => filter = i)),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppCard(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: list.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(32),
                      child: Center(child: Text('没有符合条件的会员', style: ts(14, color: C.muted))))
                  : Column(children: [
                      for (var i = 0; i < list.length; i++) ...[
                        _row(context, list[i]),
                        if (i < list.length - 1) const Divider1(indent: 72),
                      ],
                    ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _summary() {
    Widget cell(String label, String value, String? note, {Color noteColor = C.greenInk}) =>
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(label, style: ts(12, color: C.muted, h: 16)),
            const SizedBox(height: 2),
            Text(value, style: ts(20, w: FontWeight.w600, h: 28, tabular: true)),
            if (note != null) Text(note, style: ts(11, w: FontWeight.w500, color: noteColor, h: 16)),
          ]),
        );
    return AppCard(
      padding: const EdgeInsets.all(16),
      child: Row(children: [
        cell('会员总数', '1,286', '本月 +42'),
        cell('储值余额', '48.6万', '待消耗', noteColor: C.muted),
        cell('复购率', '63%', '较上月 +4%'),
      ]),
    );
  }

  Widget _row(BuildContext context, Member m) {
    final warn = m.tags.contains('次卡将到期') || m.tags.contains('待回访');
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => push(context, MemberDetailPage(member: m)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(children: [
          Avatar(m.name.substring(0, 1),
              bg: m.level == '黑金' ? C.ink : C.chip, fg: m.level == '黑金' ? C.gold : C.sub),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Text(m.name, style: ts(15, w: FontWeight.w500, h: 22)),
                const SizedBox(width: 6),
                LevelBadge(m.level),
              ]),
              const SizedBox(height: 2),
              Text('${m.plate} · ${m.lastVisit}', style: ts(12, color: C.muted, h: 16)),
            ]),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(m.amount, style: ts(15, w: FontWeight.w600, h: 22, tabular: true)),
            Text(m.amountNote,
                style: ts(11, color: warn ? C.amberInk : C.muted, w: warn ? FontWeight.w500 : FontWeight.w400, h: 16)),
          ]),
        ]),
      ),
    );
  }
}
