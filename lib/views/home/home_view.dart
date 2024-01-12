// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:routes/configs/routes/local_routes.dart';
import '../../models/contatos_model.dart';
import '../../services/navigation_service.dart';
import '../../services/service_locator.dart';
import '../../stores/list_contatos.dart';
import '../../utils/routes.dart';
import '../../widgets/cards/card_usuario.dart';
import '../../widgets/cs_app_bar.dart';
import '../../widgets/cs_icon.dart';
import '../../widgets/menu/menu.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Listas lista = getIt<Listas>();
  RouteObserverr routeObserver = getIt<RouteObserverr>();

  void _onSelect(DadosModel dados) {
    removeRoute('Inicialização');
    getIt<NavigationService>().pushNamed(LocalRoutes.DADOS, args: dados);
  }

  void removeRoute(routeName) {
    setState(() {
      if (routeName.isNotEmpty) {
        routeObserver.removeRoute(routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Menu(),
      appBar: const CsAppBar(
        title: 'Home',
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10),
            height: 50,
            child: InkWell(
              onTap: () {
                // getIt<NavigationService>().pushNamed(LocalRoutes.HOME);
              },
              child: const Row(
                children: [
                  Text(
                    'Tela inicial',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey,
                      fontSize: 15,
                    ),
                  ),
                  CsIcon.icon(
                    icon: Icons.arrow_forward_ios_outlined,
                    size: 15,
                    color: Colors.blueGrey,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: lista.listaContatos.length,
              itemBuilder: (context, index) {
                return CardUsuario(
                  key: ValueKey(lista.listaContatos[index].nome),
                  contato: lista.listaContatos[index],
                  onSelect: _onSelect,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
