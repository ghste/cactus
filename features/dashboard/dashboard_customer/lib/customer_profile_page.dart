// packages/feature_dashboard_customer/lib/src/view/customer_profile_page.dart
import 'package:authentication/authentication.dart';
import 'package:core_router/app_routes.dart';
import 'package:core_router/navigation_stack.dart';
import 'package:flutter/material.dart';

class CustomerProfilePage extends StatelessWidget {
  const CustomerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Customer Profile')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('🌵🌵🌵🌵🌵🌵'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Log out in AuthService (also clears prefs)
                authService.logout();
                // Send user back to the login screen
                NavigationStack().go(context, AppRoutes.login);
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
