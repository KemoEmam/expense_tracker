import 'package:bloc/bloc.dart';
import 'package:expense_tracker/features/home/domain/entities/expense_entity.dart';
import 'package:expense_tracker/features/home/domain/repos/expense_repo.dart';
import 'package:expense_tracker/features/setup/domain/entities/user_entity.dart';
import 'package:expense_tracker/features/setup/domain/repos/user_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ExpenseRepository _expenseRepository;
  final UserRepository _userRepository;

  HomeCubit({
    required ExpenseRepository expenseRepository,
    required UserRepository userRepository,
  })  : _expenseRepository = expenseRepository,
        _userRepository = userRepository,
        super(HomeInitial());

  Future<void> loadData() async {
    emit(HomeLoading());
    try {
      final user = await _userRepository.getUser();
      if (user == null) {
        emit(HomeError('User not found - complete setup first'));
        return;
      }
      final expenses = await _expenseRepository.getExpenses();
      emit(HomeLoaded(expenses, user));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> addExpense(Expense expense) async {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      final newExpenses = [...currentState.expenses, expense];
      await _expenseRepository.saveExpenses(newExpenses);
      emit(currentState.copyWith(expenses: newExpenses));
    }
  }

  Future<void> deleteExpense(String expenseId) async {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      final newExpenses =
          currentState.expenses.where((e) => e.id != expenseId).toList();
      await _expenseRepository.saveExpenses(newExpenses);
      emit(currentState.copyWith(expenses: newExpenses));
    }
  }

  Future<void> clearExpenses() async {
    await _expenseRepository.saveExpenses([]);
    if (state is HomeLoaded) {
      emit((state as HomeLoaded).copyWith(expenses: []));
    }
  }
}

extension on HomeLoaded {
  HomeState copyWith({required List<Expense> expenses}) {
    return HomeLoaded(expenses, user);
  }
}
