import 'package:core_router/app_routes.dart';
import 'package:core_router/navigation_stack.dart';
import 'package:flutter/material.dart';

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
            Semantics(
              header: true,
              label: 'Welcome employee. Working here is like being a cactus.',
              child: Text(
                'Welcome, Employee! \nWorking here is like being a cactus 🌵😅',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Semantics(
              button: true,
              label: 'Go to employee profile',
              child: ElevatedButton(
                onPressed:
                    () => NavigationStack().push(
                      context,
                      AppRoutes.employee.profile,
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
