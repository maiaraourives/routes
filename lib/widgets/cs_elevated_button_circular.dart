import 'package:flutter/material.dart';

class CsElevatedButtonCircular extends StatelessWidget {
  const CsElevatedButtonCircular({required this.onPressed, required this.icon, super.key});

  final Widget icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(0.5),
      ),
      child: Padding(padding: const EdgeInsets.all(5), child: Center(child: icon)),
    );
  }
}
