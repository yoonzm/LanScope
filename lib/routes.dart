import 'package:flutter/material.dart';

import 'mock/mock_data.dart';
import 'pages/appointment_add_page.dart';
import 'pages/appointments_page.dart';
import 'pages/gen/gen_routes.dart';
import 'pages/login_page.dart';
import 'pages/member_detail_page.dart';
import 'pages/order_page.dart';
import 'pages/services_page.dart';
import 'pages/settings_page.dart';
import 'pages/shell.dart';

/// 主 Tab 页面（首页 / 会员 / 库存 / 统计）。
const Map<String, int> tabRoutes = {
  'Main': 0,
  'Members': 1,
  'Inventory': 2,
  'Stats': 3,
};

/// Shell 是否在导航栈中（用于从登录/注册流程进入主界面）。
bool shellMounted = false;

Widget? pageFor(String name) {
  switch (name) {
    case 'Login':
      return const LoginPage();
    case 'Order':
      return const OrderPage();
    case 'Appointments':
      return const AppointmentsPage();
    case 'AppointmentAdd':
      return const AppointmentAddPage();
    case 'MemberDetail':
      return MemberDetailPage(member: members.first);
    case 'Services':
      return const ServicesPage();
    case 'Settings':
      return const SettingsPage();
  }
  final b = genRoutes[name];
  return b == null ? null : Builder(builder: b);
}

/// 按设计稿里的页面名跳转；目标已在栈中时回退到它，避免循环叠页。
void openRoute(BuildContext context, String name) {
  final nav = Navigator.of(context);
  if (tabRoutes.containsKey(name)) {
    tabIndex.value = tabRoutes[name]!;
    if (shellMounted) {
      nav.popUntil((r) => r.isFirst);
    } else {
      nav.pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const Shell()),
        (_) => false,
      );
    }
    return;
  }
  if (name == 'Login') {
    nav.pushAndRemoveUntil(
      MaterialPageRoute(
        settings: const RouteSettings(name: 'Login'),
        builder: (_) => const LoginPage(),
      ),
      (_) => false,
    );
    return;
  }
  final page = pageFor(name);
  if (page == null) return;
  var found = false;
  nav.popUntil((r) {
    if (r.settings.name == name) found = true;
    return true; // 只探测，不弹出
  });
  if (found) {
    nav.popUntil((r) => r.settings.name == name || r.isFirst);
    return;
  }
  nav.push(
    MaterialPageRoute(
      settings: RouteSettings(name: name),
      builder: (_) => page,
    ),
  );
}
