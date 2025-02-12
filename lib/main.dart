import 'package:expense_tracker/core/services/service_locator.dart';
import 'package:expense_tracker/core/services/shared_prefs.dart';
import 'package:expense_tracker/expense_tracker.dart';
import 'package:expense_tracker/features/setup/domain/repos/user_repo.dart';
import 'package:expense_tracker/features/setup/presentation/manager/cubit/setup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  serviceLocator();
  runApp(
    BlocProvider(
      create: (context) => SetupCubit(sl<UserRepository>()),
      child: const ExpenseTracker(),
    ),
  );
}
