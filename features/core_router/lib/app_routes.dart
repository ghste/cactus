import 'package:flutter/material.dart';

class AppRoutes {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  // Auth routes
  static const String login = '/login';

  // Route prefixes
  static const String vendorPathPrefix = '/v/';
  static const String customerPathPrefix = '/c/';
  static const String employeePathPrefix = '/e/';

  // Vendor routes
  static const vendor = VendorRoutes._();

  // Customer routes
  static const customer = CustomerRoutes._();

  // Employee routes
  static const employee = EmployeeRoutes._();
}

class VendorRoutes {
  const VendorRoutes._();

  String get dashboard => '${AppRoutes.vendorPathPrefix}dashboard';
  String get settings => '${AppRoutes.vendorPathPrefix}settings';
}

class CustomerRoutes {
  const CustomerRoutes._();

  String get dashboard => '${AppRoutes.customerPathPrefix}dashboard';
  String get profile => '${AppRoutes.customerPathPrefix}profile';
}

class EmployeeRoutes {
  const EmployeeRoutes._();

  String get dashboard => '${AppRoutes.employeePathPrefix}dashboard';
  String get profile => '${AppRoutes.employeePathPrefix}profile';
}
