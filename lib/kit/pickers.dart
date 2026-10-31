// 表单里的选择类交互：日期、车型、城市、列表选择、金额输入、车牌输入。数据均为 mock。
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../mock/mock_data.dart';
import 'keyboard.dart';

const _ink = Color(0xFF18181B);
const _muted = Color(0xFF71717A);
const _primary = Color(0xFF0485F7);
const _line = Color(0xFFEFEFF1);

// ───────── 取值控制器 ─────────
class StrCtrl extends ChangeNotifier {
  String v;
  StrCtrl(this.v);
  void set(String s) {
    if (s != v) {
      v = s;
      notifyListeners();
    }
  }
}

class HStrHolder extends StatefulWidget {
  final String initial;
  final Widget Function(BuildContext, StrCtrl) builder;
  const HStrHolder({super.key, required this.initial, required this.builder});
  @override
  State<HStrHolder> createState() => _HStrHolderState();
}

class _HStrHolderState extends State<HStrHolder> {
  late final StrCtrl ctrl = StrCtrl(widget.initial);
  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, ctrl);
}

/// 显示选择结果；初始是“选填/请选择”这类占位文案时，选择后改用正文颜色。
Widget hStr(StrCtrl c, TextStyle style, {String? placeholder}) =>
    ListenableBuilder(
      listenable: c,
      builder: (_, _) => Text(
        c.v,
        style: placeholder != null && c.v != placeholder
            ? style.copyWith(color: _ink)
            : style,
      ),
    );

// ───────── 通用底部面板 ─────────
Future<T?> _sheet<T>(
  BuildContext context,
  Widget Function(BuildContext) builder,
) => showModalBottomSheet<T>(
  context: context,
  isScrollControlled: true,
  backgroundColor: Colors.white,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
  ),
  builder: (ctx) => SafeArea(
    child: Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
      child: builder(ctx),
    ),
  ),
);

TextStyle _ts(double s, {FontWeight w = FontWeight.w400, Color c = _ink}) =>
    TextStyle(
      fontSize: s,
      fontWeight: w,
      color: c,
      decoration: TextDecoration.none,
    );

Widget _handle() => Center(
  child: Container(
    width: 40,
    height: 5,
    margin: const EdgeInsets.only(top: 10, bottom: 6),
    decoration: BoxDecoration(
      color: const Color(0xFFD4D4D8),
      borderRadius: BorderRadius.circular(3),
    ),
  ),
);

Widget _header(BuildContext ctx, String title, {VoidCallback? onOk}) => Padding(
  padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
  child: Row(
    children: [
      TextButton(
        onPressed: () => Navigator.pop(ctx),
        child: Text(
          '取消',
          style: _ts(15, w: FontWeight.w500, c: _muted),
        ),
      ),
      Expanded(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: _ts(17, w: FontWeight.w600),
        ),
      ),
      onOk == null
          ? const SizedBox(width: 64)
          : TextButton(
              onPressed: onOk,
              child: Text(
                '确定',
                style: _ts(15, w: FontWeight.w600, c: _primary),
              ),
            ),
    ],
  ),
);

/// 单选列表：点选即确定。
Future<String?> pickFromList(
  BuildContext context,
  String title,
  List<String> options,
  String current,
) => _sheet<String>(
  context,
  (ctx) => ConstrainedBox(
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(ctx).size.height * 0.7,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _handle(),
        _header(ctx, title),
        Flexible(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
            children: [
              for (final o in options)
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => Navigator.pop(ctx, o),
                  child: Container(
                    height: 52,
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: _line)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            o,
                            style: _ts(
                              15,
                              w: o == current
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              c: o == current ? _primary : _ink,
                            ),
                          ),
                        ),
                        if (o == current)
                          const Icon(
                            Icons.check_rounded,
                            size: 20,
                            color: _primary,
                          ),
                      ],
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

Widget _wheelTheme(Widget child) => CupertinoTheme(
  data: const CupertinoThemeData(
    textTheme: CupertinoTextThemeData(
      pickerTextStyle: TextStyle(fontSize: 20, color: _ink),
    ),
  ),
  child: child,
);

// ───────── 日期 ─────────
const _today = (2026, 10, 31);

Future<String?> pickDate(
  BuildContext context,
  String title, {
  required bool birthday,
  required String current,
}) {
  var picked = birthday
      ? DateTime(1990, 6, 18)
      : DateTime(_today.$1, _today.$2, _today.$3);
  final m = RegExp(r'(\d{4})\.(\d{1,2})\.(\d{1,2})').firstMatch(current);
  if (m != null) {
    picked = DateTime(
      int.parse(m.group(1)!),
      int.parse(m.group(2)!),
      int.parse(m.group(3)!),
    );
  }
  final now = DateTime(_today.$1, _today.$2, _today.$3);
  return _sheet<String>(
    context,
    (ctx) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _handle(),
        _header(
          ctx,
          title,
          onOk: () {
            final d = picked;
            Navigator.pop(
              ctx,
              birthday
                  ? '${d.year}.${d.month.toString().padLeft(2, '0')}.${d.day.toString().padLeft(2, '0')}'
                  : (d == now
                        ? '今天 ${d.month}.${d.day.toString().padLeft(2, '0')}'
                        : '${d.month.toString().padLeft(2, '0')}.${d.day.toString().padLeft(2, '0')}'),
            );
          },
        ),
        SizedBox(
          height: 216,
          child: _wheelTheme(
            CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: picked,
              minimumDate: birthday ? DateTime(1930) : DateTime(now.year - 1),
              maximumDate: birthday ? now : DateTime(now.year + 1),
              onDateTimeChanged: (d) => picked = d,
            ),
          ),
        ),
      ],
    ),
  );
}

// ───────── 品牌车型 ─────────
const carBrands = <String, List<String>>{
  '宝马': ['3系 325Li', '5系 525Li', 'X3', 'X5'],
  '奔驰': ['C 级 C260L', 'E 级 E300L', 'GLC 260'],
  '奥迪': ['A4L', 'A6L', 'Q5L'],
  '大众': ['帕萨特', '迈腾', '途观L'],
  '特斯拉': ['Model 3', 'Model Y'],
  '理想': ['L6', 'L7', 'L9'],
  '蔚来': ['ET5', 'ES6', 'ES8'],
  '比亚迪': ['汉', '唐', '海豹'],
  '丰田': ['凯美瑞', '汉兰达', '埃尔法'],
  '本田': ['雅阁', 'CR-V', '奥德赛'],
};
const carColors = <String>['黑', '白', '灰', '银', '蓝', '红'];

Future<String?> pickCarModel(BuildContext context, String current) {
  final withColor = current.contains(' · ');
  final base = current.split(' · ').first.trim();
  final brands = carBrands.keys.toList();
  var bi = brands.indexWhere((b) => base.startsWith(b));
  if (bi < 0) bi = 0;
  var mi = carBrands[brands[bi]]!.indexWhere((m) => base == '${brands[bi]} $m');
  if (mi < 0) mi = 0;
  var ci = withColor ? carColors.indexOf(current.split(' · ').last.trim()) : 0;
  if (ci < 0) ci = 0;
  return _sheet<String>(
    context,
    (ctx) => StatefulBuilder(
      builder: (ctx, setS) {
        final models = carBrands[brands[bi]]!;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _handle(),
            _header(
              ctx,
              '选择品牌车型',
              onOk: () {
                final s =
                    '${brands[bi]} ${models[mi.clamp(0, models.length - 1)]}';
                Navigator.pop(ctx, withColor ? '$s · ${carColors[ci]}' : s);
              },
            ),
            SizedBox(
              height: 216,
              child: _wheelTheme(
                Row(
                  children: [
                    Expanded(
                      child: CupertinoPicker(
                        itemExtent: 40,
                        scrollController: FixedExtentScrollController(
                          initialItem: bi,
                        ),
                        onSelectedItemChanged: (i) => setS(() {
                          bi = i;
                          mi = 0;
                        }),
                        children: [
                          for (final b in brands) Center(child: Text(b)),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: CupertinoPicker(
                        key: ValueKey(bi),
                        itemExtent: 40,
                        scrollController: FixedExtentScrollController(
                          initialItem: mi,
                        ),
                        onSelectedItemChanged: (i) => mi = i,
                        children: [
                          for (final m in models) Center(child: Text(m)),
                        ],
                      ),
                    ),
                    if (withColor)
                      Expanded(
                        child: CupertinoPicker(
                          itemExtent: 40,
                          scrollController: FixedExtentScrollController(
                            initialItem: ci,
                          ),
                          onSelectedItemChanged: (i) => ci = i,
                          children: [
                            for (final c in carColors) Center(child: Text(c)),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    ),
  );
}

// ───────── 城市 ─────────
const cityData = <String, List<String>>{
  '上海市': ['浦东新区', '徐汇区', '静安区', '闵行区', '杨浦区'],
  '北京市': ['朝阳区', '海淀区', '东城区', '西城区'],
  '杭州市': ['西湖区', '余杭区', '滨江区'],
  '南京市': ['玄武区', '鼓楼区', '江宁区'],
  '苏州市': ['姑苏区', '吴中区', '工业园区'],
  '广州市': ['天河区', '越秀区', '番禺区'],
  '深圳市': ['南山区', '福田区', '宝安区'],
  '成都市': ['锦江区', '武侯区', '高新区'],
  '武汉市': ['武昌区', '江汉区', '洪山区'],
};

Future<String?> pickCity(BuildContext context, String current) {
  final cities = cityData.keys.toList();
  var ci = cities.indexWhere((c) => current.startsWith(c));
  if (ci < 0) ci = 0;
  var di = cityData[cities[ci]]!.indexWhere((d) => current.endsWith(d));
  if (di < 0) di = 0;
  return _sheet<String>(
    context,
    (ctx) => StatefulBuilder(
      builder: (ctx, setS) {
        final ds = cityData[cities[ci]]!;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _handle(),
            _header(
              ctx,
              '选择所在城市',
              onOk: () => Navigator.pop(
                ctx,
                '${cities[ci]} · ${ds[di.clamp(0, ds.length - 1)]}',
              ),
            ),
            SizedBox(
              height: 216,
              child: _wheelTheme(
                Row(
                  children: [
                    Expanded(
                      child: CupertinoPicker(
                        itemExtent: 40,
                        scrollController: FixedExtentScrollController(
                          initialItem: ci,
                        ),
                        onSelectedItemChanged: (i) => setS(() {
                          ci = i;
                          di = 0;
                        }),
                        children: [
                          for (final c in cities) Center(child: Text(c)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: CupertinoPicker(
                        key: ValueKey(ci),
                        itemExtent: 40,
                        scrollController: FixedExtentScrollController(
                          initialItem: di,
                        ),
                        onSelectedItemChanged: (i) => di = i,
                        children: [for (final d in ds) Center(child: Text(d))],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    ),
  );
}

// ───────── 金额 ─────────
Future<String?> pickAmount(BuildContext context, String title, String current) {
  final text = TextEditingController(
    text: current.replaceAll(RegExp(r'[^0-9.]'), ''),
  );
  return showDialog<String>(
    context: context,
    builder: (ctx) => AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      title: Text(title, style: _ts(17, w: FontWeight.w600)),
      content: TextField(
        controller: text,
        autofocus: true,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        onTapOutside: onTapOutsideDismiss,
        style: _ts(24, w: FontWeight.w600),
        decoration: const InputDecoration(
          prefixText: '¥ ',
          border: InputBorder.none,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx),
          child: Text('取消', style: _ts(15, c: _muted)),
        ),
        TextButton(
          onPressed: () {
            final v = double.tryParse(text.text) ?? 0;
            Navigator.pop(ctx, '¥${v.toStringAsFixed(2)}');
          },
          child: Text(
            '确定',
            style: _ts(15, w: FontWeight.w600, c: _primary),
          ),
        ),
      ],
    ),
  );
}

// ───────── 入口：按字段类型选择 ─────────
const _techs = ['老周', '小陈', '张师傅', '李国强', '王磊'];

Future<void> hPick(
  BuildContext context,
  String kind,
  String label,
  StrCtrl c,
) async {
  String? r;
  switch (kind) {
    case 'birthday':
      r = await pickDate(context, '选择生日', birthday: true, current: c.v);
    case 'date':
      r = await pickDate(context, '选择$label', birthday: false, current: c.v);
    case 'car':
      r = await pickCarModel(context, c.v);
    case 'city':
      r = await pickCity(context, c.v);
    case 'amount':
      r = await pickAmount(context, label, c.v);
    case 'referrer':
      r = await pickFromList(context, '选择推荐人', [
        for (final m in members) '${m.name} · ${m.level}',
      ], c.v);
    case 'category':
      r = await pickFromList(context, '选择分类', [
        '镀晶镀膜',
        '洗车',
        '贴膜',
        '内饰',
        '改色膜',
        '保养维修',
      ], c.v);
    case 'duration':
      r = await pickFromList(context, '标准工时', [
        '0.5 小时',
        '1 小时',
        '2 小时',
        '3 小时',
        '4 小时',
        '6 小时',
        '8 小时',
        '2 天',
      ], c.v);
    case 'supplier':
      r = await pickFromList(context, '选择供应商', [
        '蓝盾膜业',
        '驰光化工',
        '车美汇',
        '金牌耗材',
        '新材科技',
      ], c.v);
    case 'payee':
      r = await pickFromList(context, '选择收款方', [
        '市供电局',
        '自来水公司',
        '房东',
        '美团',
        '广告公司',
        '物业',
      ], c.v);
    case 'account':
      r = await pickFromList(context, '选择$label', [
        '微信',
        '支付宝',
        '现金',
        '对公转账',
        '银行卡',
      ], c.v);
    case 'station':
      r = await pickFromList(context, '选择工位', [
        '1 号工位 · 空闲',
        '2 号工位 · 施工中',
        '3 号工位 · 施工中',
        '4 号工位 · 空闲（推荐）',
        '5 号工位 · 空闲',
      ], c.v);
    case 'tech':
      r = await pickFromList(context, '选择技师', _techs, c.v);
    case 'workorder':
      r = await pickFromList(context, '关联工单', [
        '沪A·8K29M 镀晶养护',
        '沪AD·61207 全车隐形车衣',
        '沪B·2C519 全车精洗 · 打蜡',
      ], c.v);
    case 'multiplier':
      r = await pickFromList(context, '积分倍率', [
        '1 倍',
        '1.5 倍',
        '2 倍',
        '3 倍',
      ], c.v);
    case 'gift':
      r = await pickFromList(context, '生日礼', [
        '不赠送',
        '赠精致洗车 1 次',
        '赠精致洗车 2 次',
        '赠 50 元券',
      ], c.v);
    case 'budgetFrom':
      r = await pickFromList(context, '调剂来源', [
        '营销',
        '人工',
        '房租',
        '水电',
        '其他',
      ], c.v);
    default:
      r = await pickFromList(context, label, [c.v], c.v);
  }
  if (r != null) c.set(r);
}

// ───────── 车牌输入 ─────────
const _provinces = '京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼';
const _alnum = 'ABCDEFGHJKLMNPQRSTUVWXYZ0123456789';

/// 新能源 / 燃油车切换（与页面上的“燃油车 · 蓝牌 / 新能源 · 绿牌”分段控件联动）。
final ValueNotifier<bool> plateEnergy = ValueNotifier<bool>(true);

class PlateCtrl extends ChangeNotifier {
  final List<String> chars = List.filled(8, '');
  bool green;
  int focus;
  PlateCtrl(String initial, this.green) : focus = 0 {
    final cs = initial.characters.toList();
    for (var i = 0; i < cs.length && i < 8; i++) {
      chars[i] = cs[i];
    }
    focus = (cs.length - 1).clamp(0, 7);
  }

  int get length => green ? 8 : 7;

  void setGreen(bool g) {
    if (g == green) return;
    green = g;
    if (!g) chars[7] = '';
    focus = focus.clamp(0, length - 1);
    notifyListeners();
  }

  void focusAt(int i) {
    focus = i.clamp(0, length - 1);
    notifyListeners();
  }

  void input(String ch) {
    chars[focus] = ch;
    if (focus < length - 1) focus++;
    notifyListeners();
  }

  void backspace() {
    if (chars[focus].isEmpty && focus > 0) focus--;
    chars[focus] = '';
    notifyListeners();
  }
}

class HPlate extends StatefulWidget {
  final String initial;
  final bool green;

  /// 是否跟随页面上的 plateEnergy 分段控件。
  final bool linked;
  const HPlate({
    super.key,
    required this.initial,
    required this.green,
    this.linked = false,
  });
  @override
  State<HPlate> createState() => _HPlateState();
}

class _HPlateState extends State<HPlate> {
  late final PlateCtrl ctrl = PlateCtrl(widget.initial, widget.green);
  bool _sheetOpen = false;

  @override
  void initState() {
    super.initState();
    if (widget.linked) plateEnergy.value = widget.green;
    if (widget.linked) plateEnergy.addListener(_sync);
  }

  void _sync() => ctrl.setGreen(plateEnergy.value);

  @override
  void dispose() {
    if (widget.linked) plateEnergy.removeListener(_sync);
    ctrl.dispose();
    super.dispose();
  }

  Future<void> _openKeyboard() async {
    if (_sheetOpen) return;
    _sheetOpen = true;
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: const Color(0xFFF2F2F7),
      barrierColor: Colors.black12,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => _PlateKeyboard(ctrl: ctrl),
    );
    _sheetOpen = false;
  }

  @override
  Widget build(BuildContext context) => ListenableBuilder(
    listenable: ctrl,
    builder: (context, _) {
      final g = ctrl.green;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            for (var i = 0; i < 8; i++) ...[
              if (i > 0) const SizedBox(width: 5),
              Expanded(child: _cell(i, g)),
            ],
          ],
        ),
      );
    },
  );

  Widget _cell(int i, bool g) {
    final inRange = i < ctrl.length;
    final ch = ctrl.chars[i];
    final focused = inRange && i == ctrl.focus;
    if (!inRange) {
      // 第 8 位：燃油车上显示“新能源”入口
      return GestureDetector(
        onTap: () => setState(() {
          ctrl.setGreen(true);
          if (widget.linked) plateEnergy.value = true;
          ctrl.focusAt(7);
          _openKeyboard();
        }),
        child: Container(
          height: 46,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFD4D4D8)),
          ),
          child: Text('新能源', style: _ts(9, c: _muted)),
        ),
      );
    }
    final first = i == 0;
    final bg = first
        ? (g ? const Color(0xFF1F9D55) : const Color(0xFF0B5FD6))
        : (g ? const Color(0xFFE8F7EE) : const Color(0xFFF4F4F5));
    final fg = first ? Colors.white : (g ? const Color(0xFF14532D) : _ink);
    return GestureDetector(
      onTap: () {
        ctrl.focusAt(i);
        _openKeyboard();
      },
      child: Container(
        height: 46,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(10),
          border: focused ? Border.all(color: _primary, width: 2) : null,
        ),
        child: Text(
          ch.isEmpty ? (first ? '省' : '') : ch,
          style: _ts(
            18,
            w: FontWeight.w600,
            c: ch.isEmpty ? fg.withValues(alpha: 0.5) : fg,
          ),
        ),
      ),
    );
  }
}

class _PlateKeyboard extends StatelessWidget {
  final PlateCtrl ctrl;
  const _PlateKeyboard({required this.ctrl});

  @override
  Widget build(BuildContext context) => SafeArea(
    child: ListenableBuilder(
      listenable: ctrl,
      builder: (context, _) {
        final province = ctrl.focus == 0;
        final keys = (province ? _provinces : _alnum).characters.toList();
        return Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        province ? '选择省份简称' : '输入字母或数字',
                        style: _ts(13, c: _muted),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      '完成',
                      style: _ts(16, w: FontWeight.w600, c: _primary),
                    ),
                  ),
                ],
              ),
              Wrap(
                spacing: 6,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: [
                  for (final k in keys)
                    GestureDetector(
                      onTap: () => ctrl.input(k),
                      child: Container(
                        width: province ? 34 : 33,
                        height: 44,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x22000000),
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Text(k, style: _ts(18, w: FontWeight.w500)),
                      ),
                    ),
                  GestureDetector(
                    onTap: ctrl.backspace,
                    child: Container(
                      width: 56,
                      height: 44,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD1D1D6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.backspace_outlined,
                        size: 20,
                        color: _ink,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ),
  );
}
