import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationStack {
  static final NavigationStack _instance = NavigationStack._internal();
  factory NavigationStack() => _instance;
  NavigationStack._internal();

  final List<String> _history = [];

  /// Navigate forward to [route]:
  ///  - On Web: record current URI, then call `go()` (so the browser URL changes).
  ///  - On Mobile (iOS/Android): call `push()` (so you get the native slide animation).
  void push(BuildContext context, String route) {
    if (kIsWeb) {
      // Read the current URI (non-nullable) and store it
      final currentUri =
          GoRouter.of(context).routeInformationProvider.value.uri.toString();

      _history.add(currentUri);
      context.go(route);
    } else {
      context.push(route);
    }
  }

  /// Navigate forward to [route]:
  ///  - Clear all and fade ask for fade transition
  void go(BuildContext context, String route) {
    _history.clear();
    context.go(route, extra: 'fade');
  }

  /// Go back one step:
  ///  - On Web: pop from our saved history and call `go(previousUri)`.
  ///    If there’s no history, fallback to '/'.
  ///  - On Mobile: pop() for the native back animation; if you can’t pop, do `go('/')`.
  void back(BuildContext context) {
    if (kIsWeb) {
      if (_history.isNotEmpty) {
        final previous = _history.removeLast();
        context.go(previous);
      } else {
        context.go('/');
      }
    } else {
      if (GoRouter.of(context).canPop()) {
        context.pop();
      } else {
        context.go('/');
      }
    }
  }
}
