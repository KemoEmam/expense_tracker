import 'package:expense_tracker/features/home/presentation/views/widgets/home_header_balance.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: const Column(
        spacing: 20,
        children: [
          SizedBox(
            width: double.infinity,
            child: HomeHeaderBalance(),
          ),
        ],
      ),
    );
  }
}
