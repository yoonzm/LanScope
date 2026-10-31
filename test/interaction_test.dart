import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qimei_guanjia/kit/kit.dart';
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
}
