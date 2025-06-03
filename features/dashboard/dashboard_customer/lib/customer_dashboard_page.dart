// packages/feature_dashboard_customer/lib/src/view/customer_dashboard_page.dart
import 'package:core_router/app_routes.dart';
import 'package:core_router/navigation_stack.dart';
import 'package:flutter/material.dart';

class CustomerDashboardPage extends StatelessWidget {
  const CustomerDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Customer Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome, Customer! \n  Message from Cactus Inc: \nOur cacti stay alive better than you 🌵😎🌵🌵🌵',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  () => NavigationStack().push(
                    context,
                    AppRoutes.customer.profile,
                  ),
              child: const Text('Go to Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
