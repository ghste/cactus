import 'package:authentication/authentication.dart';
import 'package:core_router/app_routes.dart';
import 'package:core_router/navigation_stack.dart';
import 'package:flutter/material.dart';

class EmployeeProfilePage extends StatelessWidget {
  const EmployeeProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => NavigationStack().back(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'This is your employee profile. \n I\'m a cactus!🌵🌵🌵🌵🌵🌵',
              textAlign: TextAlign.center,
            ),
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
