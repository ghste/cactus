import 'package:core_router/app_routes.dart';
import 'package:core_ui/page_builder_ui.dart';
import 'package:dashboard_employee/employee_dashboard_page.dart';
import 'package:dashboard_employee/employee_profile_page.dart';
import 'package:go_router/go_router.dart';

class DashboardEmployeeRoutes {
  static List<GoRoute> routes() => [
    GoRoute(
      path: AppRoutes.employee.dashboard,
      pageBuilder:
          (context, state) =>
              adaptivePage(state: state, child: const EmployeeDashboardPage()),
    ),
    GoRoute(
      path: AppRoutes.employee.profile,
      pageBuilder:
          (context, state) =>
              adaptivePage(state: state, child: const EmployeeProfilePage()),
    ),
  ];
}
