import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qimei_guanjia/kit/kit.dart';
import 'package:qimei_guanjia/mock/app_state.dart';
import 'package:qimei_guanjia/pages/home_page.dart';
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
}
