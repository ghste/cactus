// packages/feature_auth/lib/auth_service.dart

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum UserType { vendor, customer, employee, none }

class AuthService extends ChangeNotifier {
  static const _prefsKey = 'auth_user_type';

  UserType _userType = UserType.none;
  UserType get userType => _userType;
  bool get isLoggedIn => _userType != UserType.none;

  final SharedPreferences _prefs;

  AuthService._(this._prefs) {
    _loadFromPrefs();
  }

  /// Asynchronously create and initialize the AuthService.
  static Future<AuthService> create() async {
    final prefs = await SharedPreferences.getInstance();
    return AuthService._(prefs);
  }

  void _loadFromPrefs() {
    final raw = _prefs.getString(_prefsKey);
    if (raw == null) {
      _userType = UserType.none;
    } else {
      switch (raw) {
        case 'vendor':
          _userType = UserType.vendor;
          break;
        case 'customer':
          _userType = UserType.customer;
          break;
        case 'employee':
          _userType = UserType.employee;
          break;
        default:
          _userType = UserType.none;
      }
    }
  }

  Future<void> _saveToPrefs() async {
    final valueToStore =
        _userType == UserType.none
            ? null
            : _userType.toString().split('.').last;
    if (valueToStore == null) {
      await _prefs.remove(_prefsKey);
    } else {
      await _prefs.setString(_prefsKey, valueToStore);
    }
  }

  Future<void> loginAsVendor() async {
    _userType = UserType.vendor;
    await _saveToPrefs();
    notifyListeners();
  }

  Future<void> loginAsCustomer() async {
    _userType = UserType.customer;
    await _saveToPrefs();
    notifyListeners();
  }

  Future<void> loginAsEmployee() async {
    _userType = UserType.employee;
    await _saveToPrefs();
    notifyListeners();
  }

  Future<void> logout() async {
    _userType = UserType.none;
    await _saveToPrefs();
    notifyListeners();
  }
}
