import 'package:expense_tracker/core/components/custom_text_form_field.dart';
import 'package:expense_tracker/features/home/domain/entities/expense_entity.dart';
import 'package:expense_tracker/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:flutter/material.dart';

class AddExpenseBottomSheet extends StatefulWidget {
  const AddExpenseBottomSheet({super.key, required this.homeCubit});
  final HomeCubit homeCubit;

  @override
  State<AddExpenseBottomSheet> createState() => _AddExpenseBottomSheetState();
}

class _AddExpenseBottomSheetState extends State<AddExpenseBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  late String amount, description;
  String? _selectedCategory;

  final List<String> _categories = [
    'Food',
    'Travel',
    'Shopping',
    'Bills',
    'Other'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Add New Expense',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                ),
                hint: const Text('Select Category',
                    style: TextStyle(color: Colors.white70)),
                dropdownColor: Colors.grey[900],
                iconEnabledColor: Colors.white,
                style: const TextStyle(color: Colors.white),
                items: _categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category,
                        style: const TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Please select a category' : null,
                onSaved: (value) => _selectedCategory = value,
              ),
              const SizedBox(height: 15),
              CustomTextFormField(
                hintText: 'Enter amount',
                keyboardType: TextInputType.number,
                onSaved: (value) => amount = value!,
              ),
              const SizedBox(height: 15),
              CustomTextFormField(
                hintText: 'Enter description',
                keyboardType: TextInputType.text,
                maxLines: 3,
                onSaved: (value) => description = value!,
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    if (_selectedCategory == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please select a category')),
                      );
                      return;
                    }

                    final newExpense = Expense(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      amount: double.parse(amount),
                      description: description,
                      category: _selectedCategory!,
                      date: DateTime.now(),
                    );

                    widget.homeCubit.addExpense(newExpense);
                    Navigator.of(context).pop();
                  } else {
                    setState(() => _autovalidateMode = AutovalidateMode.always);
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Add Expense'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
