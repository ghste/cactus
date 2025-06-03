// lib/login_page.dart
import 'package:flutter/material.dart';
import 'package:authentication/authentication.dart';

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
            const Text('Select a user type to log in as:'),
            const SizedBox(height: 16),
            RadioListTile<UserType>(
              title: const Text('Vendor'),
              value: UserType.vendor,
              groupValue: _selectedType,
              onChanged: (val) => setState(() => _selectedType = val),
            ),
            RadioListTile<UserType>(
              title: const Text('Employee'),
              value: UserType.employee,
              groupValue: _selectedType,
              onChanged: (val) => setState(() => _selectedType = val),
            ),
            RadioListTile<UserType>(
              title: const Text('Customer'),
              value: UserType.customer,
              groupValue: _selectedType,
              onChanged: (val) => setState(() => _selectedType = val),
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
