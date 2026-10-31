import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qimei_guanjia/kit/keyboard.dart';
import 'package:qimei_guanjia/kit/kit.dart';
import 'package:qimei_guanjia/mock/app_state.dart';
import 'package:qimei_guanjia/pages/appointments_page.dart';
import 'package:qimei_guanjia/pages/home_page.dart';
import 'package:qimei_guanjia/pages/login_page.dart';
import 'package:qimei_guanjia/routes.dart';
import 'package:qimei_guanjia/pages/gen/gen_routes.dart';

void phone(WidgetTester t) {
  t.view.physicalSize = const Size(390 * 3, 900 * 3);
  t.view.devicePixelRatio = 3;
  addTearDown(t.view.reset);
}

Future<void> open(WidgetTester t, String name) async {
  phone(t);
  await t.pumpWidget(MaterialApp(home: Builder(builder: genRoutes[name]!)));
  await t.pump(const Duration(milliseconds: 100));
}

void main() {
  testWidgets('挂单列表：标签筛选会过滤条目', (t) async {
    await open(t, 'HoldList');
    expect(find.textContaining('王建国'), findsWidgets);
    expect(find.textContaining('李女士'), findsWidgets);
    await t.tap(
      find.descendant(of: find.byType(HSel), matching: find.text('待施工')).first,
    );
    await t.pump();
    expect(find.textContaining('王建国'), findsNothing);
    expect(find.textContaining('李女士'), findsNothing);
    expect(find.textContaining('苏K·5F218'), findsWidgets);
    await t.tap(
      find.descendant(of: find.byType(HSel), matching: find.text('全部 4')).first,
    );
    await t.pump();
    expect(find.textContaining('王建国'), findsWidgets);
  });

  testWidgets('商品入库：数量步进器可增减', (t) async {
    await open(t, 'StockIn');
    final six = find.text('6');
    expect(six, findsOneWidget);
    final c = t.getCenter(six);
    await t.tapAt(c + const Offset(36, 0));
    await t.pump();
    expect(find.text('7'), findsOneWidget);
    await t.tapAt(c + const Offset(-36, 0));
    await t.pump();
    await t.tapAt(c + const Offset(-36, 0));
    await t.pump();
    expect(find.text('5'), findsOneWidget);
  });

  testWidgets('开关可切换', (t) async {
    await open(t, 'NotifySettings');
    final sw = find.byType(AnimatedContainer).first;
    final before =
        (t.widget<AnimatedContainer>(sw).decoration as BoxDecoration).color;
    await t.tap(sw);
    await t.pump(const Duration(milliseconds: 300));
    final after =
        (t.widget<AnimatedContainer>(sw).decoration as BoxDecoration).color;
    expect(after, isNot(before));
  });

  testWidgets('弹层页作为底部弹层打开，并且能关闭', (t) async {
    phone(t);
    final old = FlutterError.onError;
    FlutterError.onError = (d) {
      if (!d.exceptionAsString().contains('overflowed')) old?.call(d);
    };
    addTearDown(() => FlutterError.onError = old);
    late BuildContext ctx;
    await t.pumpWidget(
      MaterialApp(
        navigatorObservers: [navTracker],
        home: Builder(
          builder: (c) {
            ctx = c;
            return const Scaffold(body: Text('会员列表'));
          },
        ),
      ),
    );
    openRoute(ctx, 'MemberFilter');
    await t.pumpAndSettle();
    expect(find.text('筛选会员'), findsOneWidget);
    expect(find.text('会员列表'), findsOneWidget); // 仍叠在原页面之上
    await t.tapAt(const Offset(195, 20)); // 点遮罩
    await t.pumpAndSettle();
    expect(find.text('筛选会员'), findsNothing);
  });

  testWidgets('首页按订阅状态显示提醒条', (t) async {
    phone(t);
    await t.pumpWidget(const MaterialApp(home: HomePage()));
    expect(find.text('去订阅'), findsNothing);
    subState.value = SubState.trialEnding;
    await t.pump();
    expect(find.text('去订阅'), findsOneWidget);
    subState.value = SubState.expiring;
    await t.pump();
    expect(find.text('去续费'), findsOneWidget);
    subState.value = SubState.normal;
  });

  testWidgets('点击输入框以外的区域会收起键盘', (t) async {
    phone(t);
    await t.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              TextField(
                onTapOutside: onTapOutsideDismiss,
                keyboardType: TextInputType.number,
              ),
              Spacer(),
              Text('空白区域'),
            ],
          ),
        ),
      ),
    );
    await t.tap(find.byType(TextField));
    await t.pump();
    expect(focusOf(t), isTrue);
    await t.tapAt(const Offset(195, 400));
    await t.pump();
    expect(focusOf(t), isFalse);
  });

  testWidgets('预约管理：列表 / 工位时间表是同一页面里的标签，不跳转', (t) async {
    final old = FlutterError.onError;
    FlutterError.onError = (d) {
      if (!d.exceptionAsString().contains('overflowed')) old?.call(d);
    };
    addTearDown(() => FlutterError.onError = old);
    phone(t);
    await t.pumpWidget(const MaterialApp(home: AppointmentsPage()));
    expect(find.text('待处理 · 现在 16:47'), findsOneWidget);
    await t.tap(find.text('工位时间表'));
    await t.pump();
    expect(find.text('待处理 · 现在 16:47'), findsNothing);
    expect(find.text('预约管理'), findsOneWidget); // 仍是同一页面（只有一个标题）
    expect(find.textContaining('共 6 个工位'), findsOneWidget);
    await t.tap(find.text('列表'));
    await t.pump();
    expect(find.text('待处理 · 现在 16:47'), findsOneWidget);
  });

  testWidgets('客户选择支持按姓名 / 车牌 / 手机号检索', (t) async {
    phone(t);
    late BuildContext ctx;
    await t.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (c) {
            ctx = c;
            return const Scaffold(body: SizedBox());
          },
        ),
      ),
    );
    pickMember(ctx);
    await t.pumpAndSettle();
    expect(find.text('王建国'), findsOneWidget);
    expect(find.text('周志远'), findsOneWidget);
    await t.enterText(find.byType(TextField), '周');
    await t.pump();
    expect(find.text('王建国'), findsNothing);
    expect(find.text('周志远'), findsOneWidget);
    await t.enterText(find.byType(TextField), '8k29');
    await t.pump();
    expect(find.text('王建国'), findsOneWidget);
    expect(find.text('周志远'), findsNothing);
    await t.enterText(find.byType(TextField), '1391688');
    await t.pump();
    expect(find.text('刘先生'), findsOneWidget);
    await t.enterText(find.byType(TextField), '不存在');
    await t.pump();
    expect(find.text('没有找到匹配的客户'), findsOneWidget);
  });

  testWidgets('密码登录：密码输入框的占位文字在输入框内垂直居中', (t) async {
    phone(t);
    await t.pumpWidget(const MaterialApp(home: LoginPage()));
    await t.tap(find.text('密码登录'));
    await t.pump();
    final hint = t.getRect(find.text('请输入密码')).center;
    final phoneHint = t.getRect(find.text('请输入手机号')).center;
    // 与手机号输入框相同的 48px 高度：占位文字应落在各自输入框的垂直中心
    final box = t.getRect(
      find
          .ancestor(of: find.text('请输入密码'), matching: find.byType(Container))
          .first,
    );
    final pbox = t.getRect(
      find
          .ancestor(of: find.text('请输入手机号'), matching: find.byType(Container))
          .first,
    );
    expect((hint.dy - box.center.dy).abs() < 14, isTrue);
    expect((phoneHint.dy - pbox.center.dy).abs() < 14, isTrue);
    expect(t.getRect(find.text('请输入密码')).left, closeTo(54, 1)); // 靠左对齐（左内边距 14）
  });

  testWidgets('新增会员：生日 / 品牌车型 / 城市选择器可用并回写', (t) async {
    final old = FlutterError.onError;
    FlutterError.onError = (d) {
      if (!d.exceptionAsString().contains('overflowed')) old?.call(d);
    };
    addTearDown(() => FlutterError.onError = old);
    await open(t, 'MemberAdd');
    expect(find.text('选填，用于生日礼'), findsOneWidget);
    await t.tap(find.text('生日'));
    await t.pumpAndSettle();
    expect(find.text('选择生日'), findsOneWidget);
    await t.tap(find.text('确定'));
    await t.pumpAndSettle();
    expect(find.text('选填，用于生日礼'), findsNothing);
    expect(find.textContaining('1990.06.18'), findsOneWidget);

    await t.tap(find.text('品牌车型'));
    await t.pumpAndSettle();
    expect(find.text('选择品牌车型'), findsOneWidget);
    await t.drag(find.text('宝马').last, const Offset(0, -40));
    await t.pumpAndSettle();
    await t.tap(find.text('确定'));
    await t.pumpAndSettle();
    expect(find.text('宝马 5系 525Li'), findsNothing);
  });

  testWidgets('车牌输入：点格子弹出键盘，可输入并切换新能源', (t) async {
    final old = FlutterError.onError;
    FlutterError.onError = (d) {
      if (!d.exceptionAsString().contains('overflowed')) old?.call(d);
    };
    addTearDown(() => FlutterError.onError = old);
    await open(t, 'VehicleAdd');
    expect(find.text('沪'), findsWidgets);
    await t.tap(find.text('6').first); // 最后一格
    await t.pumpAndSettle();
    expect(find.text('输入字母或数字'), findsOneWidget);
    await t.tap(find.text('Z').last);
    await t.pump();
    expect(find.text('Z'), findsWidgets);
    await t.tap(find.text('完成'));
    await t.pumpAndSettle();
    expect(find.text('输入字母或数字'), findsNothing);
    await t.tap(find.text('沪').first);
    await t.pumpAndSettle();
    expect(find.text('选择省份简称'), findsOneWidget);
  });
}

bool focusOf(WidgetTester t) =>
    t.widget<EditableText>(find.byType(EditableText)).focusNode.hasFocus;
