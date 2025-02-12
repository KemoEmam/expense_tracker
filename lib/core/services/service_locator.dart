import 'package:expense_tracker/features/home/data/repo_impl/expense_repo_impl.dart';
import 'package:expense_tracker/features/home/domain/repos/expense_repo.dart';
import 'package:expense_tracker/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:expense_tracker/features/setup/data/repo_impl/user_repo_impl.dart';
import 'package:expense_tracker/features/setup/domain/repos/user_repo.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
void serviceLocator() {
  sl.registerLazySingleton<ExpenseRepository>(() => ExpenseRepositoryImpl());
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
  sl.registerFactory<HomeCubit>(() => HomeCubit(
        expenseRepository: sl<ExpenseRepository>(),
        userRepository: sl<UserRepository>(),
      ));
}
