// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:animated_pie_chart/animated_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../configs/routes/local_routes.dart';
import '../../services/navigation_service.dart';
import '../../services/service_locator.dart';
import '../../utils/routes.dart';
import '../../widgets/cs_app_bar.dart';
import '../../widgets/cs_icon.dart';
import '../../widgets/cs_icon_button.dart';

class FrutaFavoritaView extends StatefulWidget {
  const FrutaFavoritaView({super.key});

  @override
  State<FrutaFavoritaView> createState() => _FrutaFavoritaViewState();
}

class _FrutaFavoritaViewState extends State<FrutaFavoritaView> {
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
        title: 'Fruta favorita',
        leading: CsIconButton(
          icon: const CsIcon.icon(icon: Icons.arrow_back, color: Colors.white),
          onPressed: () {
            getIt<NavigationService>().pop();
            removeRoute('Fruta favorita');
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
                      return Observer(
                        builder: (context) {
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
                      );
                    },
                  ).toList(),
                );
              },
            ),
          ),
          Flexible(
            child: Container(
              margin: const EdgeInsets.all(15),
              child: AnimatedPieChart(
                sort: true,
                stokeWidth: 8.0,
                padding: 3.0,
                animatedSpeed: 500,
                pieRadius: 70.0,
                colorsList: const [
                  Colors.green,
                  Colors.yellow,
                  Colors.red,
                  Colors.purple,
                  Colors.amber,
                  Colors.brown,
                ],
                pieData: [
                  for (int i = 0; i < pieChartList.length; i++)
                    MdPieChart(
                      value: pieChartList[i].value,
                      name: pieChartList[i].name,
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<MdPieChart> pieChartList = [
    MdPieChart(value: 30, name: 'Kiwi'),
    MdPieChart(value: 10, name: 'Uva'),
    MdPieChart(value: 10, name: 'Manga'),
    MdPieChart(value: 20, name: 'Maça'),
    MdPieChart(value: 10, name: 'Pera'),
    MdPieChart(value: 20, name: 'Melancia'),
  ];
}
