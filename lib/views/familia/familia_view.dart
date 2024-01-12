// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../configs/routes/local_routes.dart';
import '../../services/navigation_service.dart';
import '../../services/service_locator.dart';
import '../../utils/routes.dart';
import '../../widgets/cs_app_bar.dart';
import '../../widgets/cs_button_graficos.dart';
import '../../widgets/cs_icon.dart';
import '../../widgets/cs_icon_button.dart';

class FamiliaView extends StatefulWidget {
  const FamiliaView({super.key});

  @override
  State<FamiliaView> createState() => _FamiliaViewState();
}

class _FamiliaViewState extends State<FamiliaView> {
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
    return Scaffold(
      appBar: CsAppBar(
        title: 'Família',
        leading: CsIconButton(
          icon: const CsIcon.icon(icon: Icons.arrow_back, color: Colors.white),
          onPressed: () {
            getIt<NavigationService>().pop();
            removeRoute('Família');
            removeRoute('Inicialização');
          },
        ),
      ),
      backgroundColor: Colors.white,
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
                      return Observer(builder: (context) {
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

                              route = LocalRoutes.mapRouteName(route);

                              Navigator.of(context).popUntil(ModalRoute.withName(route));

                              if (currentRouteIndex != routeObserver.routeHistory.length - 1) {
                                getIt<NavigationService>().pushNamed(route);
                              }
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
                      });
                    },
                  ).toList(),
                );
              },
            ),
          ),
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
