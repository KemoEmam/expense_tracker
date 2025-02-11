import 'package:expense_tracker/core/components/new_box_widget.dart';
import 'package:expense_tracker/core/styles/app_colors.dart';
import 'package:expense_tracker/features/home/presentation/views/widgets/incomde_and_expense_indicators.dart';
import 'package:flutter/material.dart';

class HomeHeaderBalance extends StatelessWidget {
  const HomeHeaderBalance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NeuBoxWidget(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          children: [
            Text(
              'T O T A L   B A L A N C E',
              style: TextStyle(fontSize: 25, color: AppColors.secondary),
            ),
            Text('\$100.00', style: TextStyle(fontSize: 30)),
            SizedBox(height: 20),
            IncomeAndExpenseIndicators(),
          ],
        ),
      ),
    );
  }
}
