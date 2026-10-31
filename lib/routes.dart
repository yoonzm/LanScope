import 'package:flutter/material.dart';

import 'mock/app_state.dart';
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

/// 记录导航栈中的页面名，用来判断“目标页是否已经打开过”。
class NavTracker extends NavigatorObserver {
  final List<Route<dynamic>> stack = [];
  bool has(String name) => stack.any((r) => r.settings.name == name);
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      stack.add(route);
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      stack.remove(route);
  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      stack.remove(route);
  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    final i = oldRoute == null ? -1 : stack.indexOf(oldRoute);
    if (i >= 0) {
      if (newRoute != null) {
        stack[i] = newRoute;
      } else {
        stack.removeAt(i);
      }
    } else if (newRoute != null) {
      stack.add(newRoute);
    }
  }
}

final NavTracker navTracker = NavTracker();

/// 同一界面的两种视图（如预约的“列表 / 工位时间表”）：切换时原地替换，不叠页。
const Set<String> _swapViews = {'Appointments', 'AppointmentSchedule'};

/// 结果页：覆盖在提交它的表单页之上，返回时不再回到表单。
const Set<String> _resultPages = {
  'PaySuccess',
  'PayUnbound',
  'RechargeSuccess',
  'PlanPaid',
  'RenewPaid',
  'RegDone',
  'MemberAddDone',
  'BindDone',
};

String? _routeName(BuildContext context) =>
    ModalRoute.of(context)?.settings.name;

/// 按设计稿里的页面名跳转：
/// - 设计稿里叠在别的页面上的弹层，用底部弹层打开；
/// - 目标页已在栈中时回退到它，避免循环叠页；
/// - 同一界面的不同视图 / 结果页采用替换，保持返回逻辑与设计一致。
void openRoute(BuildContext context, String name) {
  final nav = Navigator.of(context);
  final cur = _routeName(context);
  final inSheet = cur != null && cur.startsWith('sheet:');
  if (inSheet) {
    nav.pop(); // 先收起当前弹层
    if (sheetParents[cur.substring(6)] == name) return; // 点遮罩 / 取消：回到所属页面
  }
  if (genSheets.containsKey(name)) {
    final nc = nav.context;
    showModalBottomSheet<void>(
      context: nc,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      routeSettings: RouteSettings(name: 'sheet:$name'),
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(ctx).size.height * 0.94,
          ),
          child: SingleChildScrollView(child: genSheets[name]!(ctx)),
        ),
      ),
    );
    return;
  }
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
  if (name == 'PlanPaid' || name == 'RenewPaid') {
    subState.value = SubState.normal;
  }
  final route = MaterialPageRoute<void>(
    settings: RouteSettings(name: name),
    builder: (_) => page,
  );
  // 同一界面的视图切换：原地替换，无转场
  if (_swapViews.contains(name) && cur != null && _swapViews.contains(cur)) {
    nav.pushReplacement(
      PageRouteBuilder<void>(
        settings: RouteSettings(name: name),
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        pageBuilder: (_, _, _) => page,
      ),
    );
    return;
  }
  final found = navTracker.has(name);
  if (found) {
    nav.popUntil((r) => r.settings.name == name || r.isFirst);
    return;
  }
  if (_resultPages.contains(name) && nav.canPop()) {
    nav.pushReplacement(route);
    return;
  }
  nav.push(route);
}
