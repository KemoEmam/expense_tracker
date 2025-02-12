import 'package:expense_tracker/features/setup/presentation/views/widgets/setup_view_body.dart';
import 'package:flutter/material.dart';

class SetupView extends StatelessWidget {
  const SetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SetupViewBody(),
      ),
    );
  }
}
