import 'package:expense_tracker/core/components/new_box_widget.dart';
import 'package:expense_tracker/features/home/domain/entities/expense_entity.dart';
import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  final Expense expense;
  final VoidCallback onDelete;

  const ListViewItem({
    super.key,
    required this.expense,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return NeuBoxWidget(
      child: ListTile(
        leading: Icon(Icons.money_off, color: _getCategoryColor()),
        title: Text(expense.description),
        subtitle: Text(expense.category),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('-\$${expense.amount.toStringAsFixed(2)}'),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.redAccent),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }

  Color _getCategoryColor() {
    switch (expense.category) {
      case 'Food':
        return Colors.red;
      case 'Travel':
        return Colors.blue;
      case 'Shopping':
        return Colors.purple;
      case 'Bills':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}
