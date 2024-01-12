// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
    getIt<NavigationService>().pushNamed(LocalRoutes.DADOS, args: dados);
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
          SizedBox(
            height: 50,
            child: Observer(
              builder: (_) {
                return ListView(
                  padding: const EdgeInsets.all(5),
                  scrollDirection: Axis.horizontal,
                  children: routeObserver.routeHistory.map(
                    (route) {
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: InkWell(
                          onTap: () {
                            final currentRouteIndex = routeObserver.routeHistory.indexOf(route);

                            if (currentRouteIndex < routeObserver.routeHistory.length - 1) {
                              final routesToRemove = routeObserver.routeHistory.sublist(currentRouteIndex);
                              routesToRemove.forEach((removedRoute) {
                                routeObserver.removeRoute(removedRoute);
                              });
                            }

                            getIt<NavigationService>().pushNamed(route);
                          },
                          child: Row(
                            children: [
                              Text(
                                route,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blueGrey,
                                  fontSize: 15,
                                ),
                              ),
                              const CsIcon.icon(
                                icon: Icons.arrow_forward_ios_outlined,
                                size: 15,
                                color: Colors.blueGrey,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ).toList(),
                );
              },
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
