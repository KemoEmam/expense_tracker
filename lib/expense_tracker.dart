import 'package:expense_tracker/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({super.key});

  @override
  State<ExpenseTracker> createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  late Future<GoRouter> _routerFuture;

  @override
  void initState() {
    super.initState();
    _routerFuture = createRouter();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GoRouter>(
      future: _routerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final router = snapshot.data!;
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark(),
            routerConfig: router,
          );
        }
        return const MaterialApp(
          home: Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
