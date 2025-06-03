import 'package:core_router/app_routes.dart';
import 'package:core_ui/page_builder_ui.dart';
import 'package:dashboard_customer/customer_dashboard_page.dart';
import 'package:dashboard_customer/customer_profile_page.dart';
import 'package:go_router/go_router.dart';

class DashboardCustomerRoutes {
  static List<GoRoute> routes() => [
    GoRoute(
      path: AppRoutes.customer.dashboard,
      pageBuilder:
          (context, state) =>
              adaptivePage(state: state, child: const CustomerDashboardPage()),
    ),
    GoRoute(
      path: AppRoutes.customer.profile,
      pageBuilder:
          (context, state) =>
              adaptivePage(state: state, child: const CustomerProfilePage()),
    ),
  ];
}
