import 'package:flutter/material.dart';
import 'package:routes/configs/routes/local_routes.dart';

import '../../models/contatos_model.dart';
import '../../services/navigation_service.dart';
import '../../services/service_locator.dart';
import '../../utils/routes.dart';
import '../../widgets/cs_elevated_button_circular.dart';
import '../../widgets/cs_icon.dart';

class DadosView extends StatefulWidget {
  const DadosView({required this.dados, super.key});

  final DadosModel dados;

  @override
  State<DadosView> createState() => _DadosViewState();
}

class _DadosViewState extends State<DadosView> {
  String routeName = '';
  RouteObserverr routeObserver = getIt<RouteObserverr>();

  void removeRoute(routeName) {
    setState(() {
      if (routeName.isNotEmpty) {
        routeObserver.removeRoute(routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        primary: true,
        child: SizedBox(
          width: double.maxFinite,
          height: 890,
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 79,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          widget.dados.perfil,
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 220,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(62), topRight: Radius.circular(62)),
                  ),
                  child: ListView(
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.only(left: 25, top: 5, bottom: 10, right: 20),
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Nome', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          widget.dados.nome,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(color: Color.fromRGBO(158, 158, 158, 1), fontSize: 14),
                        ),
                        leading: const CsIcon.icon(
                          icon: Icons.person,
                          size: 30,
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Número', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          widget.dados.numero,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(color: Color.fromRGBO(158, 158, 158, 1), fontSize: 14),
                        ),
                        leading: const CsIcon.icon(
                          icon: Icons.phone,
                          size: 30,
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Tem filhos', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          widget.dados.filho,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(color: Color.fromRGBO(158, 158, 158, 1), fontSize: 14),
                        ),
                        leading: const CsIcon.icon(
                          icon: Icons.bedroom_baby,
                          size: 30,
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Fruta favorita', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          widget.dados.fruta,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(color: Color.fromRGBO(158, 158, 158, 1), fontSize: 14),
                        ),
                        leading: const CsIcon.icon(
                          icon: Icons.apple,
                          size: 30,
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Time do coração', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          widget.dados.time,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(color: Color.fromRGBO(158, 158, 158, 1), fontSize: 14),
                        ),
                        leading: const CsIcon.icon(
                          icon: Icons.sports_football,
                          size: 30,
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Seleção do coração', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          widget.dados.selecao,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(color: Color.fromRGBO(158, 158, 158, 1), fontSize: 14),
                        ),
                        leading: const CsIcon.icon(
                          icon: Icons.sports,
                          size: 30,
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Em sua casa mora', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          widget.dados.mora,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(color: Color.fromRGBO(158, 158, 158, 1), fontSize: 14),
                        ),
                        leading: const CsIcon.icon(
                          icon: Icons.holiday_village,
                          size: 30,
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Quantidade de irmãos', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          widget.dados.irmaos,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(color: Color.fromRGBO(158, 158, 158, 1), fontSize: 14),
                        ),
                        leading: const CsIcon.icon(
                          icon: Icons.family_restroom,
                          size: 30,
                        ),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Viagem favorita em família', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          widget.dados.viagem,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(color: Color.fromRGBO(158, 158, 158, 1), fontSize: 14),
                        ),
                        leading: const CsIcon.icon(
                          icon: Icons.flight_outlined,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 10,
                child: CsElevatedButtonCircular(
                  onPressed: () {
                    getIt<NavigationService>().pushNamed(LocalRoutes.HOME);
                    // removeRoute('Dados');
                  },
                  icon: CsIcon.icon(icon: Icons.arrow_back, color: theme.primaryColor, size: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
