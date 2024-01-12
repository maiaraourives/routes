import 'package:flutter/material.dart';

import '../cs_icon.dart';
import '../cs_icon_button.dart';

///Botão customizado que é utilizado na [CustomAppBar] para abrir/fechar o [CustomDrawer]
class CustomDrawerLeading extends StatelessWidget {
  const CustomDrawerLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return CsIconButton(
      icon: const CsIcon.icon(
        icon: Icons.menu,
        color: Colors.white,
      ),
      onPressed: () {
        if (Scaffold.of(context).isDrawerOpen) {
          Scaffold.of(context).openEndDrawer();
        } else {
          Scaffold.of(context).openDrawer();
        }
      },
    );
  }
}
