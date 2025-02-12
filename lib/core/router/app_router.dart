import 'package:expense_tracker/core/router/routes.dart';
import 'package:expense_tracker/core/services/service_locator.dart';
import 'package:expense_tracker/features/home/domain/repos/expense_repo.dart';
import 'package:expense_tracker/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:expense_tracker/features/home/presentation/views/home_view.dart';
import 'package:expense_tracker/features/setup/domain/repos/user_repo.dart';
import 'package:expense_tracker/features/setup/presentation/manager/cubit/setup_cubit.dart';
import 'package:expense_tracker/features/setup/presentation/views/setup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: '_root');
Future<GoRouter> createRouter() async {
  final isSetupCompleted = await sl<UserRepository>().isSetupCompleted();
  final initialRoute = isSetupCompleted ? Routes.home : Routes.setup;

  return GoRouter(
    initialLocation: initialRoute,
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
        builder: (context, state) => BlocProvider(
          create: (context) => HomeCubit(
            expenseRepository: sl<ExpenseRepository>(),
            userRepository: sl<UserRepository>(),
          )..loadData(),
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: Routes.setup,
        builder: (context, state) => BlocProvider(
          create: (context) => SetupCubit(sl<UserRepository>()),
          child: const SetupView(),
        ),
      ),
    ],
  );
}
