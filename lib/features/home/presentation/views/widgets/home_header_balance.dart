import 'package:expense_tracker/core/components/new_box_widget.dart';
import 'package:expense_tracker/core/styles/app_colors.dart';
import 'package:expense_tracker/features/home/domain/entities/expense_entity.dart';
import 'package:expense_tracker/features/home/presentation/views/widgets/expense_indicator.dart';
import 'package:expense_tracker/features/setup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class HomeHeaderBalance extends StatelessWidget {
  final User user;
  final List<Expense> expenses;

  const HomeHeaderBalance({
    super.key,
    required this.user,
    required this.expenses,
  });

  double get totalExpenses => expenses.fold(0, (sum, e) => sum + e.amount);
  double get currentBalance => user.initialBalance - totalExpenses;

  @override
  Widget build(BuildContext context) {
    return NeuBoxWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          children: [
            Text('Welcome, ${user.name}!', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text(
              'T O T A L   B A L A N C E',
              style: TextStyle(fontSize: 16, color: AppColors.secondary),
            ),
            Text('\$${currentBalance.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 30)),
            const SizedBox(height: 20),
            ExpenseIndicator(totalExpenses: totalExpenses),
          ],
        ),
      ),
    );
  }
}
