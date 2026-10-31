import 'package:flutter/material.dart';

import '../mock/mock_data.dart';
import '../kit/keyboard.dart';
import '../theme.dart';
import '../widgets/app_icon.dart';
import '../widgets/common.dart';

class AppointmentAddPage extends StatefulWidget {
  const AppointmentAddPage({super.key});
  @override
  State<AppointmentAddPage> createState() => _AppointmentAddPageState();
}

class _AppointmentAddPageState extends State<AppointmentAddPage> {
  bool isMember = true;
  final Set<int> picked = {2};
  int dateIdx = 0;
  String time = '17:30';
  int station = 3;
  String tech = '老周';
  bool notify = true;
  bool remind = true;
  bool deposit = false;

  static const _dates = ['今天 10.31', '明天 11.01', '周一 11.02', '周二 11.03'];
  static const _times = [
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
    '18:00',
    '18:30',
    '19:00',
    '19:30',
  ];
  static const _disabled = {
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
  };

  int get total => picked.fold(0, (s, i) => s + apptServices[i].price);

  void submit() {
    if (picked.isEmpty) {
      toast(context, '请至少选择一个服务项目');
      return;
    }
    appointmentStore.add(
      Appointment(
        time,
        '1.5 小时',
        '沪C·9H318',
        isMember ? '刘先生' : '散客',
        isMember ? '金卡' : '散客',
        picked.map((i) => apptServices[i].name).join(' · '),
        '${station + 1} 号工位 · $tech',
        ApptStatus.waiting,
      ),
    );
    Navigator.of(context).pop();
    toast(context, '预约成功，已通知客户');
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const SubHeader('新建预约'),
            Expanded(
              child: ListView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                children: [
                  _label('客户'),
                  Segmented(
                    labels: const ['会员', '散客'],
                    selected: isMember ? 0 : 1,
                    onChanged: (i) => setState(() => isMember = i == 0),
                  ),
                  const SizedBox(height: 10),
                  if (isMember)
                    AppCard(
                      radius: 20,
                      padding: const EdgeInsets.all(14),
                      child: Row(
                        children: [
                          const Avatar(
                            '刘',
                            size: 44,
                            bg: C.amberSoft,
                            fg: C.amberInk,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '刘先生',
                                      style: ts(15, w: FontWeight.w500, h: 22),
                                    ),
                                    const SizedBox(width: 6),
                                    const LevelBadge('金卡'),
                                  ],
                                ),
                                Text(
                                  '139 **** 5026 · 余额 ¥1,860',
                                  style: ts(12, color: C.muted, h: 16),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '更换',
                            style: ts(
                              13,
                              w: FontWeight.w500,
                              color: C.primaryInk,
                              h: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 10),
                  AppCard(
                    radius: 20,
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      children: [
                        const PlateTag('沪C·9H318'),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            '大众 帕萨特 · 灰',
                            style: ts(14, color: C.sub, h: 20),
                          ),
                        ),
                        AppIcon('chevronRight', color: C.faint),
                      ],
                    ),
                  ),
                  _label('服务项目', sub: '可多选'),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (var i = 0; i < apptServices.length; i++)
                        _chip(
                          '${apptServices[i].name} ¥${money(apptServices[i].price)}',
                          picked.contains(i),
                          () => setState(
                            () => picked.contains(i)
                                ? picked.remove(i)
                                : picked.add(i),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text('预计 1.5 小时', style: ts(12, color: C.muted, h: 16)),
                  _label('到店时间'),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (var i = 0; i < _dates.length; i++)
                        _chip(
                          _dates[i],
                          dateIdx == i,
                          () => setState(() => dateIdx = i),
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final t in _times)
                        _chip(
                          t,
                          time == t,
                          _disabled.contains(t)
                              ? null
                              : () => setState(() => time = t),
                          width: 72,
                        ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text('灰色为已过去或已约满', style: ts(12, color: C.muted, h: 16)),
                  _label('安排'),
                  AppCard(
                    radius: 20,
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 44,
                              child: Text('工位', style: ts(14, color: C.muted)),
                            ),
                            Expanded(
                              child: Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  for (var i = 0; i < 4; i++)
                                    _chip(
                                      '${i + 1} 号',
                                      station == i,
                                      () => setState(() => station = i),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            SizedBox(
                              width: 44,
                              child: Text('技师', style: ts(14, color: C.muted)),
                            ),
                            Expanded(
                              child: Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  for (final t in ['老周', '小陈', '张师傅'])
                                    _chip(
                                      t,
                                      tech == t,
                                      () => setState(() => tech = t),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  _label('备注', sub: '选填'),
                  Container(
                    height: 72,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: softShadow,
                    ),
                    child: TextField(
                      onTapOutside: onTapOutsideDismiss,
                      maxLines: 2,
                      style: ts(14),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        isCollapsed: true,
                        hintText: '例如：客户要求不要打蜡',
                        hintStyle: ts(14, color: C.muted),
                      ),
                    ),
                  ),
                  _label('通知与定金'),
                  AppCard(
                    radius: 20,
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Column(
                      children: [
                        _switch(
                          '预约成功后通知客户',
                          '微信优先，失败转短信',
                          notify,
                          (v) => setState(() => notify = v),
                        ),
                        const Divider1(indent: 16),
                        _switch(
                          '到店前 2 小时提醒客户',
                          '按“通知与消息”设置发送',
                          remind,
                          (v) => setState(() => remind = v),
                        ),
                        const Divider1(indent: 16),
                        _switch(
                          '收取预约定金',
                          '客户爽约将不予退还 · ¥50',
                          deposit,
                          (v) => setState(() => deposit = v),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                20,
                12,
                20,
                bottom > 0 ? bottom : 16,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Color(0xFFE8E8EA), offset: Offset(0, -1)),
                  BoxShadow(
                    color: Color(0x0A000000),
                    blurRadius: 24,
                    offset: Offset(0, -8),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '10.31 今天 $time · ${station + 1} 号工位',
                          style: ts(12, color: C.muted, h: 16),
                        ),
                        Text(
                          '预计 ¥${money(total)}',
                          style: ts(
                            22,
                            w: FontWeight.w600,
                            h: 28,
                            tabular: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PrimaryButton('确认预约', onTap: submit),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _label(String t, {String? sub}) => Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 10),
    child: Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: t,
            style: ts(15, w: FontWeight.w600, h: 22),
          ),
          if (sub != null)
            TextSpan(
              text: ' · $sub',
              style: ts(12, color: C.muted),
            ),
        ],
      ),
    ),
  );

  Widget _chip(String t, bool on, VoidCallback? tap, {double? width}) =>
      GestureDetector(
        onTap: tap,
        child: Container(
          width: width,
          height: 36,
          alignment: width != null ? Alignment.center : null,
          padding: width != null
              ? null
              : const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: tap == null ? C.chip : (on ? C.primarySoft : Colors.white),
            borderRadius: BorderRadius.circular(18),
            boxShadow: on || tap == null ? null : softShadow,
            border: on ? Border.all(color: C.primary, width: 1.5) : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                t,
                style: ts(
                  13,
                  w: FontWeight.w500,
                  color: tap == null ? C.faint : (on ? C.primaryInk : C.ink),
                  h: 18,
                ),
              ),
            ],
          ),
        ),
      );

  Widget _switch(String t, String sub, bool v, ValueChanged<bool> f) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(t, style: ts(14, w: FontWeight.w500, h: 20)),
              Text(sub, style: ts(12, color: C.muted, h: 16)),
            ],
          ),
        ),
        Switch(
          value: v,
          onChanged: f,
          activeTrackColor: C.primary,
          activeThumbColor: Colors.white,
        ),
      ],
    ),
  );
}
