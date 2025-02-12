// features/home/presentation/views/widgets/expense_indicator.dart
import 'package:expense_tracker/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ExpenseIndicator extends StatelessWidget {
  final double totalExpenses;
  const ExpenseIndicator({
    super.key,
    required this.totalExpenses,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.arrow_downward,
            color: Colors.red,
            size: 25,
          ),
        ),
        const SizedBox(width: 10),
        Column(
          children: [
            Text('Expense',
                style: TextStyle(fontSize: 15, color: AppColors.secondary)),
            Text('\$${totalExpenses.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 15))
          ],
        )
      ],
    );
  }
}
