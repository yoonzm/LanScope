// 由 tools/design_to_flutter.py 生成，请勿手工修改。
import 'package:flutter/widgets.dart';

import 'appointment_detail_page.dart';
import 'appointment_schedule_page.dart';
import 'appointment_settings_page.dart';
import 'bind_done_page.dart';
import 'bind_h5_page.dart';
import 'budget_edit_page.dart';
import 'budget_total_page.dart';
import 'card_tier_edit_page.dart';
import 'card_tiers_page.dart';
import 'channel_config_page.dart';
import 'expense_add_page.dart';
import 'expense_budget_page.dart';
import 'expense_detail_page.dart';
import 'expenses_page.dart';
import 'hold_list_page.dart';
import 'invoices_page.dart';
import 'main_expiring_page.dart';
import 'main_trial_page.dart';
import 'member_add_page.dart';
import 'member_add_done_page.dart';
import 'member_follow_up_page.dart';
import 'member_records_page.dart';
import 'notify_log_page.dart';
import 'notify_settings_page.dart';
import 'notify_template_page.dart';
import 'pay_success_page.dart';
import 'pay_unbound_page.dart';
import 'plan_checkout_page.dart';
import 'plan_expired_page.dart';
import 'plan_paid_page.dart';
import 'plans_page.dart';
import 'product_detail_page.dart';
import 'recharge_page.dart';
import 'recharge_success_page.dart';
import 'reg_done_page.dart';
import 'reg_phone_page.dart';
import 'reg_shop_page.dart';
import 'renew_paid_page.dart';
import 'role_permission_page.dart';
import 'service_edit_page.dart';
import 'staff_page.dart';
import 'staff_detail_page.dart';
import 'stock_check_page.dart';
import 'stock_in_page.dart';
import 'stock_out_page.dart';
import 'store_edit_page.dart';
import 'store_info_page.dart';
import 'subscription_page.dart';
import 'vehicle_add_page.dart';
import 'appointment_reschedule_sheet.dart';
import 'bind_invite_sheet.dart';
import 'budget_adjust_sheet.dart';
import 'hold_sheet_sheet.dart';
import 'member_filter_sheet.dart';
import 'renew_sheet.dart';

final Map<String, WidgetBuilder> genRoutes = {
  'AppointmentDetail': (_) => const AppointmentDetailPage(),
  'AppointmentSchedule': (_) => const AppointmentSchedulePage(),
  'AppointmentSettings': (_) => const AppointmentSettingsPage(),
  'BindDone': (_) => const BindDonePage(),
  'BindH5': (_) => const BindH5Page(),
  'BudgetEdit': (_) => const BudgetEditPage(),
  'BudgetTotal': (_) => const BudgetTotalPage(),
  'CardTierEdit': (_) => const CardTierEditPage(),
  'CardTiers': (_) => const CardTiersPage(),
  'ChannelConfig': (_) => const ChannelConfigPage(),
  'ExpenseAdd': (_) => const ExpenseAddPage(),
  'ExpenseBudget': (_) => const ExpenseBudgetPage(),
  'ExpenseDetail': (_) => const ExpenseDetailPage(),
  'Expenses': (_) => const ExpensesPage(),
  'HoldList': (_) => const HoldListPage(),
  'Invoices': (_) => const InvoicesPage(),
  'MainExpiring': (_) => const MainExpiringPage(),
  'MainTrial': (_) => const MainTrialPage(),
  'MemberAdd': (_) => const MemberAddPage(),
  'MemberAddDone': (_) => const MemberAddDonePage(),
  'MemberFollowUp': (_) => const MemberFollowUpPage(),
  'MemberRecords': (_) => const MemberRecordsPage(),
  'NotifyLog': (_) => const NotifyLogPage(),
  'NotifySettings': (_) => const NotifySettingsPage(),
  'NotifyTemplate': (_) => const NotifyTemplatePage(),
  'PaySuccess': (_) => const PaySuccessPage(),
  'PayUnbound': (_) => const PayUnboundPage(),
  'PlanCheckout': (_) => const PlanCheckoutPage(),
  'PlanExpired': (_) => const PlanExpiredPage(),
  'PlanPaid': (_) => const PlanPaidPage(),
  'Plans': (_) => const PlansPage(),
  'ProductDetail': (_) => const ProductDetailPage(),
  'Recharge': (_) => const RechargePage(),
  'RechargeSuccess': (_) => const RechargeSuccessPage(),
  'RegDone': (_) => const RegDonePage(),
  'RegPhone': (_) => const RegPhonePage(),
  'RegShop': (_) => const RegShopPage(),
  'RenewPaid': (_) => const RenewPaidPage(),
  'RolePermission': (_) => const RolePermissionPage(),
  'ServiceEdit': (_) => const ServiceEditPage(),
  'Staff': (_) => const StaffPage(),
  'StaffDetail': (_) => const StaffDetailPage(),
  'StockCheck': (_) => const StockCheckPage(),
  'StockIn': (_) => const StockInPage(),
  'StockOut': (_) => const StockOutPage(),
  'StoreEdit': (_) => const StoreEditPage(),
  'StoreInfo': (_) => const StoreInfoPage(),
  'Subscription': (_) => const SubscriptionPage(),
  'VehicleAdd': (_) => const VehicleAddPage(),
};

/// 底部弹层（设计稿中叠在其他页面上的界面）。
final Map<String, WidgetBuilder> genSheets = {
  'AppointmentReschedule': (_) => const AppointmentRescheduleSheet(),
  'BindInvite': (_) => const BindInviteSheet(),
  'BudgetAdjust': (_) => const BudgetAdjustSheet(),
  'HoldSheet': (_) => const HoldSheetSheet(),
  'MemberFilter': (_) => const MemberFilterSheet(),
  'Renew': (_) => const RenewSheet(),
};

/// 弹层所属的页面（设计稿里的遮罩点击目标）。
const Map<String, String> sheetParents = {
  'AppointmentReschedule': 'AppointmentDetail',
  'BindInvite': 'PayUnbound',
  'BudgetAdjust': 'ExpenseBudget',
  'HoldSheet': 'Order',
  'MemberFilter': 'Members',
  'Renew': 'Subscription',
};
