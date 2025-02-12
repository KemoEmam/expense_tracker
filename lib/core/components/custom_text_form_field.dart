import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextStyle? hintTextStyle;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color enabledBorderColor;
  final void Function(String?)? onSaved;
  final double borderRadius;
  final int maxLines;
  final Color? fillColor; // Default to grey[800] if not provided

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.hintTextStyle,
    this.controller,
    this.validator,
    required this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.borderColor = Colors.grey,
    this.focusedBorderColor = Colors.grey,
    this.enabledBorderColor = const Color(0xffeff2f2),
    this.suffixIcon,
    this.prefixIconColor,
    this.suffixIconColor,
    this.onSaved,
    this.borderRadius = 8.0,
    this.maxLines = 1,
    this.fillColor, // Optional color
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      maxLines: maxLines,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintTextStyle,
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
        suffixIcon: suffixIcon,
        suffixIconColor: suffixIconColor ?? Colors.grey,
        fillColor: fillColor ?? Colors.grey[800], // Default color if null
        filled: true,
        border: _borderBuilder(borderColor),
        focusedBorder: _borderBuilder(focusedBorderColor),
        enabledBorder: _borderBuilder(enabledBorderColor),
      ),
    );
  }

  OutlineInputBorder _borderBuilder(Color color, {double width = 1.1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
