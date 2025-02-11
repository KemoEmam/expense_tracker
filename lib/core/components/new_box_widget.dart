import 'package:flutter/material.dart';

class NeuBoxWidget extends StatelessWidget {
  const NeuBoxWidget({super.key, this.child, this.onTap});
  final Widget? child;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    // bool isDarkMode =
    //     BlocProvider.of<DarkLightCubit>(context).state is DarkThemeState;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                spreadRadius: 5,
                color: Colors.black,
                blurRadius: 14,
                offset: const Offset(4, 4),
              ),
              BoxShadow(
                color: Colors.grey.shade600,
                blurRadius: 14,
                offset: const Offset(-4, -4),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 12,
            right: 12,
            top: 12,
            bottom: 12,
          ),
          child: child,
        ),
      ),
    );
  }
}
