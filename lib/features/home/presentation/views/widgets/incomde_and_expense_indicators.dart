import 'package:expense_tracker/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class IncomeAndExpenseIndicators extends StatelessWidget {
  const IncomeAndExpenseIndicators({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.arrow_upward,
            color: Colors.green,
            size: 25,
          ),
        ),
        SizedBox(width: 10),
        Column(
          children: [
            Text('Income',
                style: TextStyle(fontSize: 15, color: AppColors.secondary)),
            Text('\$100.00', style: TextStyle(fontSize: 15))
          ],
        ),
        Spacer(),
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.arrow_downward,
            color: Colors.red,
            size: 25,
          ),
        ),
        SizedBox(width: 10),
        Column(
          children: [
            Text('Expense',
                style: TextStyle(fontSize: 15, color: AppColors.secondary)),
            Text('\$100.00', style: TextStyle(fontSize: 15))
          ],
        )
      ],
    );
  }
}
