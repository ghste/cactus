import 'package:core_router/app_routes.dart';
import 'package:core_ui/page_builder_ui.dart';
import 'package:dashboard_vendor/dashboard/view/vendor_dashboard_page.dart';
import 'package:dashboard_vendor/dashboard/view/vendor_settings_page.dart';
import 'package:go_router/go_router.dart';

class DashboardVendorRoutes {
  static List<GoRoute> routes() => [
    GoRoute(
      path: AppRoutes.vendor.dashboard,
      name: "vendorDash",
      pageBuilder:
          (context, state) =>
              adaptivePage(state: state, child: const VendorDashboardPage()),
      routes: [],
    ),
    GoRoute(
      path: AppRoutes.vendor.settings,
      name: "vendorSettings",
      pageBuilder:
          (context, state) =>
              adaptivePage(state: state, child: const VendorSettingsPage()),
    ),
  ];
}
