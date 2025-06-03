// packages/feature_dashboard_vendor/lib/src/view/vendor_dashboard_page.dart
import 'package:core_router/core_router.dart';
import 'package:flutter/material.dart';

class VendorDashboardPage extends StatelessWidget {
  const VendorDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vendor Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Cactus Inc. \nGrow the cactus. \nSell the cactus. \nProfit. \nGrow another cactus. 🌵😎',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  () => NavigationStack().push(
                    context,
                    AppRoutes.vendor.settings,
                  ),
              child: const Text('Go to Vendor Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
