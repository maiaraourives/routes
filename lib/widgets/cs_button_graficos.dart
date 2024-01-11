import 'package:flutter/material.dart';

import 'cs_icon.dart';

class CsButtonGraficos extends StatelessWidget {
  const CsButtonGraficos({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key,
  });

  final IconData? icon;
  final Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        color: theme.primaryColor,
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              const SizedBox(width: 20),
              CsIcon.icon(
                icon: icon,
                size: 40,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
