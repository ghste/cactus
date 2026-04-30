import 'package:core_router/app_routes.dart';
import 'package:core_ui/page_builder_ui.dart';
import 'package:dashboard_vendor/dashboard/view/vendor_dashboard_page.dart';
import 'package:dashboard_vendor/dashboard/view_model/vendor_dashboard_view_model.dart';
import 'package:dashboard_vendor/settings/vendor_settings_page.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DashboardVendorRoutes {
  static List<GoRoute> routes() => [
    GoRoute(
      path: AppRoutes.vendor.dashboard,
      name: "vendorDash",
      pageBuilder:
          (context, state) => adaptivePage(
            state: state,
            child: ChangeNotifierProvider(
              create: (_) => VendorDashboardViewModel(),
              child: const VendorDashboardPage(),
            ),
          ),
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
