import 'package:core_router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmployeeDashboardPage extends StatelessWidget {
  const EmployeeDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome, Employee! \nWorking here is like being a cactus 🌵😅',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.push(AppRoutes.employee.profile),
              child: const Text('Go to Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
