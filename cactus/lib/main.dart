import 'package:authentication/authentication.dart';
import 'package:database/database.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'app_router.dart';

void main() async {
  setPathUrlStrategy();

  WidgetsFlutterBinding.ensureInitialized();

  // Await the asynchronous initialization of AuthService
  await initAuthService();
  await Database.instance.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // C 1.
  // c 2.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Modular Flutter App',
    );
  }
}
