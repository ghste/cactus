import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart'
    show kIsWeb, defaultTargetPlatform, TargetPlatform;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Returns a Page that, at runtime, chooses:
/// If state.extra == 'fade', always a fade transition.
/// Else if on web (kIsWeb), fade transition.
/// Else if on iOS, a CupertinoPage.
/// Else (Android or other), a MaterialPage.
Page<T> adaptivePage<T>({required GoRouterState state, required Widget child}) {
  // If the caller explicitly did context.go(..., extra: 'fade'), then fade:
  final wantsFade = state.extra == 'fade';

  if (wantsFade || kIsWeb) {
    // Always fade if web OR if extra == 'fade'
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  // On iOS native:
  if (defaultTargetPlatform == TargetPlatform.iOS) {
    return CupertinoPage<T>(key: state.pageKey, child: child);
  }

  // On Android (or any other non-iOS mobile):
  return MaterialPage<T>(key: state.pageKey, child: child);
}
