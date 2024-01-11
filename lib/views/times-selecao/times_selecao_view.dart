import 'package:flutter/material.dart';

import '../../configs/routes/local_routes.dart';
import '../../widgets/cs_app_bar.dart';
import '../../widgets/cs_button_graficos.dart';

class TimesSelecaoView extends StatelessWidget {
  const TimesSelecaoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CsAppBar(
        title: 'Times e seleções',
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          CsButtonGraficos(
            icon: Icons.sports_baseball,
            onTap: () => Navigator.pushNamed(context, LocalRoutes.SELCAO_CORACAO),
            title: 'Seleção do coração',
          ),
          CsButtonGraficos(
            icon: Icons.sports,
            onTap: () => Navigator.pushNamed(context, LocalRoutes.TIMES_CORACAO),
            title: 'Time do coração',
          ),
        ],
      ),
    );
  }
}
