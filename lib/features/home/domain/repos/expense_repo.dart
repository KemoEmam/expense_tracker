import 'package:expense_tracker/features/home/domain/entities/expense_entity.dart';

abstract class ExpenseRepository {
  Future<List<Expense>> getExpenses();
  Future<void> saveExpenses(List<Expense> expenses);
  Future<void> clearExpenses();
}
