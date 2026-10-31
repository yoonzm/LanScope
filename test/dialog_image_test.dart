import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qimei_guanjia/pages/gen/gen_routes.dart';

void main() {
  void phone(WidgetTester t) {
    t.view.physicalSize = const Size(390 * 3, 900 * 3);
    t.view.devicePixelRatio = 3;
    addTearDown(t.view.reset);
  }

  testWidgets('确认弹窗：取消 / 确定后遮罩完全消失', (t) async {
    phone(t);
    await t.pumpWidget(MaterialApp(
      home: Builder(builder: genRoutes['ServiceEdit']!),
    ));
    await t.pumpAndSettle();
    final del = find.text('删除此项目');
    await t.ensureVisible(del);
    await t.tap(del);
    await t.pumpAndSettle();
    expect(find.text('确认删除此项目？'), findsOneWidget);
    await t.tap(find.text('取消'));
    await t.pumpAndSettle();
    expect(find.text('确认删除此项目？'), findsNothing);
    // 弹窗关闭后只剩页面自己的遮罩（无）
    expect(find.byType(ModalBarrier).evaluate().where((e) {
      final b = e.widget as ModalBarrier;
      return b.color != null && b.color != Colors.transparent;
    }), isEmpty);
  });

  testWidgets('上传入口：点击弹出“拍照 / 从相册选择”，取消后关闭', (t) async {
    phone(t);
    await t.pumpWidget(MaterialApp(
      home: Builder(builder: genRoutes['EcoFiling']!),
    ));
    await t.pumpAndSettle();
    await t.tap(find.text('上传排水许可证'));
    await t.pumpAndSettle();
    expect(find.text('拍照'), findsOneWidget);
    expect(find.text('从相册选择'), findsOneWidget);
    await t.tap(find.text('取消'));
    await t.pumpAndSettle();
    expect(find.text('从相册选择'), findsNothing);
  });
}
