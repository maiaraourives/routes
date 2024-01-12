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

class TimesSelecaoView extends StatefulWidget {
  const TimesSelecaoView({super.key});

  @override
  State<TimesSelecaoView> createState() => _TimesSelecaoViewState();
}

class _TimesSelecaoViewState extends State<TimesSelecaoView> {
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
        title: 'Times e seleções',
        leading: CsIconButton(
          icon: const CsIcon.icon(icon: Icons.arrow_back, color: Colors.white),
          onPressed: () {
            getIt<NavigationService>().pop();
            removeRoute('Times e seleção');
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

                              getIt<NavigationService>().pushNamed(routeObserver.mapRouteName(route));
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
