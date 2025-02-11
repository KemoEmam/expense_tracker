import 'package:expense_tracker/core/router/routes.dart';
import 'package:expense_tracker/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: '_root');

final router = GoRouter(
  initialLocation: Routes.home,
  navigatorKey: _rootNavigatorKey,
  errorBuilder: (context, state) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Oops! Page not found',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go(Routes.home), // Redirect to home
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  },
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const HomeView(),
    ),
  ],
);
