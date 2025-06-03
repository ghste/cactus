import 'package:core_router/app_routes.dart';
import 'package:core_ui/page_builder_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:authentication/authentication.dart';
import 'package:dashboard_vendor/dashboard_vendor.dart';
import 'package:dashboard_customer/dashboard_customer.dart';
import 'package:dashboard_employee/dashboard_employee.dart';

final router = GoRouter(
  initialLocation: AppRoutes.login,
  refreshListenable: authService,
  navigatorKey: AppRoutes.rootNavigatorKey,
  redirect: (context, state) {
    final loc = state.uri.toString();

    if (!authService.isLoggedIn) {
      if (loc != AppRoutes.login) return AppRoutes.login;
      return null;
    }

    if (loc == AppRoutes.login || loc == '/') {
      if (authService.userType == UserType.vendor) {
        return AppRoutes.vendor.dashboard;
      } else if (authService.userType == UserType.customer) {
        return AppRoutes.customer.dashboard;
      } else if (authService.userType == UserType.employee) {
        return AppRoutes.employee.dashboard;
      }
    }

    if (state.uri.path.startsWith(AppRoutes.vendorPathPrefix) &&
        authService.userType != UserType.vendor) {
      return '/notfound';
    } else if (state.uri.path.startsWith(AppRoutes.customerPathPrefix) &&
        authService.userType != UserType.customer) {
      return '/notfound';
    } else if (state.uri.path.startsWith(AppRoutes.employeePathPrefix) &&
        authService.userType != UserType.employee) {
      return '/notfound';
    }
    return null;
  },
  routes: [
    GoRoute(
      path: AppRoutes.login,
      name: 'login',
      pageBuilder:
          (context, state) =>
              adaptivePage(state: state, child: const LoginPage()),
    ),
    ...DashboardVendorRoutes.routes(),
    ...DashboardEmployeeRoutes.routes(),
    ...DashboardCustomerRoutes.routes(),
  ],
);
