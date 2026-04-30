// lib/login_page.dart
import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserType? _selectedType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Semantics(
              header: true,
              child: const Text('Select a user type to log in as:'),
            ),
            const SizedBox(height: 16),
            RadioGroup<UserType>(
              groupValue: _selectedType,
              onChanged: (UserType? val) => setState(() => _selectedType = val),
              child: Column(
                children: const [
                  RadioListTile<UserType>(
                    title: Text('Vendor'),
                    value: UserType.vendor,
                  ),
                  RadioListTile<UserType>(
                    title: Text('Employee'),
                    value: UserType.employee,
                  ),
                  RadioListTile<UserType>(
                    title: Text('Customer'),
                    value: UserType.customer,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed:
                  _selectedType == null
                      ? null
                      : () {
                        if (_selectedType == UserType.vendor) {
                          authService.loginAsVendor();
                        } else if (_selectedType == UserType.customer) {
                          authService.loginAsCustomer();
                        } else if (_selectedType == UserType.employee) {
                          authService.loginAsEmployee();
                        }
                      },
              child: const Text('Log In'),
            ),
          ],
        ),
      ),
    );
  }
}
