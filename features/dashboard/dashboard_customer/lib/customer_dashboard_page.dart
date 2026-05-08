// packages/feature_dashboard_customer/lib/src/view/customer_dashboard_page.dart
import 'package:core_router/app_routes.dart';
import 'package:core_router/navigation_stack.dart';
import 'package:database/database.dart';
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
            Semantics(
              header: true,
              label:
                  'Welcome customer. Message from Cactus Inc: Our cacti stay alive better than you.',
              child: Text(
                'Welcome, Customer! \n  Message from Cactus Inc: \nOur cacti stay alive better than you 🌵😎🌵🌵🌵',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ValueListenableBuilder<Promotion?>(
              valueListenable: Database.instance.promotion,
              builder: (context, promotion, _) {
                if (promotion == null) {
                  return const SizedBox.shrink();
                }
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.green.shade200),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Featured Promotion',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${promotion.cactus} \$${promotion.price.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Semantics(
              button: true,
              label: 'Go to customer profile',
              child: ElevatedButton(
                onPressed:
                    () => NavigationStack().push(
                      context,
                      AppRoutes.customer.profile,
                    ),
                child: const Text('Go to Profile'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
