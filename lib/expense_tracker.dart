import 'package:expense_tracker/core/router/app_router.dart';
import 'package:flutter/material.dart';

class ExpenseTracker extends StatelessWidget {
  const ExpenseTracker({super.key});

  @override
  Widget build(BuildContext context) {
    // CustomButtonP
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        routerConfig: router
        // home: child,
        );
  }
}
