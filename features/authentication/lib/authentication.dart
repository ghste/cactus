// packages/feature_auth/lib/feature_auth.dart
library;

import 'package:authentication/auth_service.dart';

export 'auth_service.dart';
export 'login_page.dart';
export 'not_found_page.dart';

/// A top‐level holder for the one shared AuthService instance.
/// We’ll initialize this in main() before runApp().
late final AuthService authService;

/// Call this once (e.g. in main()) before you use `authService`.
/// It will load from SharedPreferences and assign `authService`.
Future<void> initAuthService() async {
  authService = await AuthService.create();
}
