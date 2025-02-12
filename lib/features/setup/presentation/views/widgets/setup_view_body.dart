import 'package:expense_tracker/core/router/routes.dart';
import 'package:expense_tracker/features/setup/presentation/manager/cubit/setup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SetupViewBody extends StatefulWidget {
  const SetupViewBody({super.key});

  @override
  State<SetupViewBody> createState() => _SetupViewBodyState();
}

class _SetupViewBodyState extends State<SetupViewBody> {
  final AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late double _initialBalance;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Your Name'),
            validator: (value) => value!.isEmpty ? 'Required' : null,
            onSaved: (value) => _name = value!,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Initial Balance'),
            keyboardType: TextInputType.number,
            validator: (value) => value!.isEmpty ? 'Required' : null,
            onSaved: (value) => _initialBalance = double.parse(value!),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                await context
                    .read<SetupCubit>()
                    .saveUserData(_name, _initialBalance);
                // ignore: use_build_context_synchronously
                context.go(Routes.home);
              }
            },
            child: const Text('Get Started'),
          )
        ],
      ),
    );
  }
}
