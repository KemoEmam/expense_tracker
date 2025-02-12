import 'dart:convert';

import 'package:expense_tracker/core/services/shared_prefs.dart';
import 'package:expense_tracker/features/home/domain/entities/expense_entity.dart';
import 'package:expense_tracker/features/home/domain/repos/expense_repo.dart';

class ExpenseRepositoryImpl implements ExpenseRepository {
  @override
  Future<List<Expense>> getExpenses() async {
    final jsonString = await Prefs.getString('expenses');
    if (jsonString == null || jsonString.isEmpty) {
      return [];
    }
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((e) => Expense.fromJson(e)).toList();
  }

  @override
  Future<void> saveExpenses(List<Expense> expenses) async {
    final jsonList = expenses.map((e) => e.toJson()).toList();
    await Prefs.saveString('expenses', jsonEncode(jsonList));
  }

  @override
  Future<void> clearExpenses() async {
    await Prefs.removeData('expenses');
  }
}
