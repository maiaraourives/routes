import 'package:flutter/material.dart';

import '../../configs/routes/local_routes.dart';
import '../../widgets/cs_app_bar.dart';
import '../../widgets/cs_button_graficos.dart';

class FamiliaView extends StatefulWidget {
  const FamiliaView({super.key});

  @override
  State<FamiliaView> createState() => _FamiliaViewState();
}

class _FamiliaViewState extends State<FamiliaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CsAppBar(
        title: 'família',
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          CsButtonGraficos(
            icon: Icons.bedroom_baby,
            onTap: () => Navigator.pushNamed(context, LocalRoutes.FILHO),
            title: 'Tem filhos',
          ),
          CsButtonGraficos(
            icon: Icons.holiday_village,
            onTap: () => Navigator.pushNamed(context, LocalRoutes.MORA_COM),
            title: 'Mora com alguém',
          ),
          CsButtonGraficos(
            icon: Icons.local_taxi_sharp,
            onTap: () => Navigator.pushNamed(context, LocalRoutes.VIAGEM),
            title: 'Viagem favorita com a família',
          ),
          CsButtonGraficos(
            icon: Icons.family_restroom,
            onTap: () => Navigator.pushNamed(context, LocalRoutes.TEM_IRMAO),
            title: 'Tem irmãos',
          ),
        ],
      ),
    );
  }
}
