import 'package:expense_tracker/features/home/domain/entities/expense_entity.dart';
import 'package:expense_tracker/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:expense_tracker/features/home/presentation/views/widgets/home_header_balance.dart';
import 'package:expense_tracker/features/home/presentation/views/widgets/list_view_item.dart';
import 'package:expense_tracker/features/home/presentation/views/widgets/show_modal_sheet.dart';
import 'package:expense_tracker/features/setup/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.user, required this.expenses});
  final User user;
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(
                      width: double.infinity,
                      child: HomeHeaderBalance(
                        user: user,
                        expenses: expenses,
                      ),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: ListViewItem(
                      expense: expenses[index],
                      onDelete: () => context
                          .read<HomeCubit>()
                          .deleteExpense(expenses[index].id),
                    ),
                  ),
                  childCount: expenses.length,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            onPressed: () => _showBottomSheet(context),
            backgroundColor: Colors.blueAccent,
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

void _showBottomSheet(BuildContext context) {
  final homeCubit = BlocProvider.of<HomeCubit>(context);

  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.grey[900],
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    isScrollControlled: true,
    builder: (context) {
      return AddExpenseBottomSheet(homeCubit: homeCubit);
    },
  );
}
