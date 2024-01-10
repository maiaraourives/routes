import 'package:flutter/material.dart';

class CsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CsAppBar({
    required this.title,
    this.preferredSize = const Size.fromHeight(65),
    this.roundedRectangleBorder,
    this.elevation = 3,
    this.actions,
    this.leading,
    super.key,
  });

  @override
  final Size preferredSize;
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final double elevation;
  final RoundedRectangleBorder? roundedRectangleBorder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      elevation: elevation,
      backgroundColor: theme.appBarTheme.backgroundColor,
      toolbarHeight: 65,
      actionsIconTheme: theme.appBarTheme.iconTheme,
      shape: roundedRectangleBorder,
      scrolledUnderElevation: null,
      centerTitle: true,
      title: FittedBox(
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      actions: actions,
      leading: leading,
    );
  }
}
