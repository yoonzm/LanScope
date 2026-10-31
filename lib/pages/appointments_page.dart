import 'package:flutter/material.dart';

import '../mock/mock_data.dart';
import '../theme.dart';
import '../routes.dart';
import '../widgets/app_icon.dart';
import '../widgets/common.dart';
import 'appointment_add_page.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({super.key});
  @override
  State<AppointmentsPage> createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  int day = 5; // 周六 31 日（今天）
  ApptStatus? filter;

  // 其他日期的示例预约（仅展示用）
  List<Appointment> _otherDay() {
    final n = _days[day].$3;
    const tpl = [
      ('09:30', '1 小时', '沪B·3D820', '赵女士', '金卡', '基础洗车', '1 号工位 · 小陈'),
      ('11:00', '1.5 小时', '沪A·7L305', '陈女士', '金卡', '内饰精洗', '2 号工位 · 老周'),
      ('14:00', '1 小时', '沪C·9H318', '刘先生', '金卡', '全车精洗', '3 号工位 · 小陈'),
    ];
    return [
      for (var i = 0; i < n && i < tpl.length; i++)
        Appointment(
          tpl[i].$1,
          tpl[i].$2,
          tpl[i].$3,
          tpl[i].$4,
          tpl[i].$5,
          tpl[i].$6,
          tpl[i].$7,
          day < 5 ? ApptStatus.done : ApptStatus.waiting,
        ),
    ];
  }

  static const _days = [
    ('一', '26', 0),
    ('二', '27', 1),
    ('三', '28', 0),
    ('四', '29', 2),
    ('五', '30', 3),
    ('六', '31', 6),
    ('日', '1', 2),
  ];

  @override
  void initState() {
    super.initState();
    appointmentStore.addListener(_refresh);
  }

  @override
  void dispose() {
    appointmentStore.removeListener(_refresh);
    super.dispose();
  }

  void _refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final items = day == 5 ? appointmentStore.items : _otherDay();
    int count(ApptStatus s) => items.where((a) => a.status == s).length;
    bool show(Appointment a) => filter == null || a.status == filter;
    final pending =
        items.where((a) => a.status != ApptStatus.done && show(a)).toList()
          ..sort((a, b) => a.time.compareTo(b.time));
    final done =
        items.where((a) => a.status == ApptStatus.done && show(a)).toList()
          ..sort((a, b) => a.time.compareTo(b.time));

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () => push(context, const AppointmentAddPage()),
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 22),
          decoration: BoxDecoration(
            color: C.ink,
            borderRadius: BorderRadius.circular(25),
            boxShadow: const [
              BoxShadow(
                color: Color(0x4018181B),
                blurRadius: 20,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppIcon('add', color: Colors.white, size: 20),
              const SizedBox(width: 6),
              Text(
                '新建预约',
                style: ts(15, w: FontWeight.w600, color: Colors.white, h: 22),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SubHeader(
              '预约管理',
              trailing: Align(
                alignment: Alignment.centerRight,
                child: RoundBtn(
                  'filter',
                  label: '预约设置',
                  onTap: () => openRoute(context, 'AppointmentSettings'),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
                children: [
                  _week(),
                  const SizedBox(height: 16),
                  Segmented(
                    labels: const ['列表', '工位时间表'],
                    selected: 0,
                    onChanged: (i) => i == 1
                        ? openRoute(context, 'AppointmentSchedule')
                        : null,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _stat(
                        '待到店',
                        count(ApptStatus.waiting),
                        C.amberInk,
                        ApptStatus.waiting,
                      ),
                      _stat(
                        '已到店',
                        count(ApptStatus.arrived),
                        C.greenInk,
                        ApptStatus.arrived,
                      ),
                      _stat(
                        '超时未到',
                        count(ApptStatus.late),
                        C.redInk,
                        ApptStatus.late,
                      ),
                      _stat(
                        '已完成',
                        count(ApptStatus.done),
                        C.muted,
                        ApptStatus.done,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  if (pending.isEmpty && done.isEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 48),
                      child: Center(
                        child: Text(
                          '当天没有符合条件的预约',
                          style: ts(14, color: C.muted),
                        ),
                      ),
                    ),
                  ...[
                    Text(
                      '待处理 · 现在 16:47',
                      style: ts(13, w: FontWeight.w500, color: C.muted, h: 18),
                    ),
                    const SizedBox(height: 10),
                    for (final a in pending) ...[
                      _card(context, a),
                      const SizedBox(height: 10),
                    ],
                    const SizedBox(height: 10),
                    Text(
                      '已完成',
                      style: ts(13, w: FontWeight.w500, color: C.muted, h: 18),
                    ),
                    const SizedBox(height: 10),
                    for (final a in done) ...[
                      _card(context, a),
                      const SizedBox(height: 10),
                    ],
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _week() => AppCard(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
    radius: 22,
    child: Row(
      children: [
        for (var i = 0; i < _days.length; i++)
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => day = i),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: day == i ? C.ink : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Text(
                      _days[i].$1,
                      style: ts(12, color: day == i ? C.faint : C.muted, h: 16),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      _days[i].$2,
                      style: ts(
                        16,
                        w: FontWeight.w600,
                        color: day == i ? Colors.white : C.ink,
                        h: 22,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      _days[i].$3 == 0 ? '—' : '${_days[i].$3} 单',
                      style: ts(10, color: day == i ? C.gold : C.muted, h: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    ),
  );

  Widget _stat(String label, int n, Color c, ApptStatus st) => Expanded(
    child: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => setState(() => filter = filter == st ? null : st),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: filter == st ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
          boxShadow: filter == st ? softShadow : null,
        ),
        child: Column(
          children: [
            Text(
              '$n',
              style: ts(22, w: FontWeight.w600, color: c, h: 28, tabular: true),
            ),
            Text(label, style: ts(12, color: C.muted, h: 16)),
          ],
        ),
      ),
    ),
  );

  (String, Color, Color) _statusStyle(ApptStatus s) {
    switch (s) {
      case ApptStatus.waiting:
        return ('待到店', C.amberSoft, C.amberInk);
      case ApptStatus.arrived:
        return ('已到店', C.greenSoft, C.greenInk);
      case ApptStatus.late:
        return ('超时未到', C.redSoft, C.redInk);
      case ApptStatus.done:
        return ('已完成', C.chip, C.muted);
    }
  }

  Widget _card(BuildContext context, Appointment a) {
    final st = _statusStyle(a.status);
    final done = a.status == ApptStatus.done;
    Widget btn(String t, {bool primary = false, required VoidCallback onTap}) =>
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 34,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: primary ? C.ink : C.chip,
              borderRadius: BorderRadius.circular(17),
            ),
            child: Text(
              t,
              style: ts(
                13,
                w: FontWeight.w500,
                color: primary ? Colors.white : C.ink,
                h: 18,
              ),
            ),
          ),
        );
    return AppCard(
      radius: 22,
      padding: const EdgeInsets.all(14),
      onTap: () => openRoute(context, 'AppointmentDetail'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                a.time,
                style: ts(
                  20,
                  w: FontWeight.w600,
                  h: 26,
                  tabular: true,
                  color: done ? C.muted : C.ink,
                ),
              ),
              const SizedBox(width: 8),
              Text(a.duration, style: ts(12, color: C.muted, h: 16)),
              const Spacer(),
              Pill(st.$1, bg: st.$2, fg: st.$3),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              PlateTag(a.plate, green: done),
              const SizedBox(width: 10),
              Text(a.customer, style: ts(14, w: FontWeight.w500, h: 20)),
              const SizedBox(width: 6),
              if (a.level != '散客')
                LevelBadge(a.level)
              else
                Pill('散客', bg: C.chip, fg: C.muted, size: 11),
            ],
          ),
          const SizedBox(height: 8),
          Text(a.service, style: ts(14, h: 20)),
          const SizedBox(height: 2),
          Text(
            a.station,
            style: ts(
              12,
              color: a.status == ApptStatus.late ? C.redInk : C.muted,
              h: 16,
            ),
          ),
          if (!done) ...[
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                btn(
                  '改期',
                  onTap: () => openRoute(context, 'AppointmentReschedule'),
                ),
                const SizedBox(width: 8),
                if (a.status == ApptStatus.arrived)
                  btn(
                    '去开单',
                    primary: true,
                    onTap: () => openRoute(context, 'Order'),
                  )
                else if (a.status == ApptStatus.late)
                  btn(
                    '联系客户',
                    primary: true,
                    onTap: () => toast(context, '拨打 ${a.customer} 电话（演示）'),
                  )
                else
                  btn(
                    '客户到店',
                    primary: true,
                    onTap: () {
                      appointmentStore.setStatus(a, ApptStatus.arrived);
                      toast(context, '${a.plate} 已标记到店');
                    },
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
