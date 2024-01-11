import 'package:flutter/material.dart';

import 'cs_icon.dart';

class CsListTile extends StatelessWidget {
  const CsListTile({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key,
  });

  final String title;
  final IconData? icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: Colors.grey[200],
      leading: CsIcon.icon(
        icon: icon,
        color: Colors.blueGrey,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.blueGrey,
          fontWeight: FontWeight.w400,
          fontSize: 18,
          shadows: [
            Shadow(
              blurRadius: 2,
              color: Color(0x5DA7A7A7),
              offset: Offset(1, 1),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
