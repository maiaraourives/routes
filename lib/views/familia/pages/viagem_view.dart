// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../configs/routes/local_routes.dart';
import '../../../services/navigation_service.dart';
import '../../../services/service_locator.dart';
import '../../../utils/routes.dart';
import '../../../widgets/cs_app_bar.dart';
import '../../../widgets/cs_icon.dart';
import '../../../widgets/cs_icon_button.dart';

class ViagemViewView extends StatefulWidget {
  const ViagemViewView({super.key});

  @override
  State<ViagemViewView> createState() => _ViagemViewViewState();
}

class _ViagemViewViewState extends State<ViagemViewView> {
  RouteObserverr routeObserver = getIt<RouteObserverr>();

  void removeRoute(routeName) {
    setState(() {
      if (routeName.isNotEmpty) {
        routeObserver.removeRoute(routeName);
      }
    });
  }

  Map<String, double> dataMap = {
    'Angra dos Reis - SP': 1,
    'Milão - Itália': 1,
    'Santa Cruz - RS': 1,
    'São Paulo - SP': 3,
    'Posadas - Argentina': 2,
    'Cancún - México': 1,
    'Roma - Itália': 1,
  };

  final gradientList = <List<Color>>[
    [
      Colors.blueAccent,
      Colors.blueAccent.withOpacity(0.5),
    ],
    [
      Colors.redAccent,
      Colors.redAccent.withOpacity(0.5),
    ],
    [
      Colors.amberAccent,
      Colors.amberAccent.withOpacity(0.5),
    ],
    [
      Colors.pinkAccent,
      Colors.pinkAccent.withOpacity(0.5),
    ],
    [
      Colors.cyanAccent,
      Colors.cyanAccent.withOpacity(0.5),
    ],
    [
      Colors.yellowAccent,
      Colors.yellowAccent.withOpacity(0.5),
    ],
    [
      Colors.purple,
      Colors.purpleAccent.withOpacity(0.5),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CsAppBar(
        title: 'Viagem favorita com a família',
        leading: CsIconButton(
          icon: const CsIcon.icon(icon: Icons.arrow_back, color: Colors.white),
          onPressed: () {
            removeRoute('Família');
            removeRoute('Viagem favorita');
            Navigator.pushNamed(context, LocalRoutes.FAMILIA);
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
          Flexible(
            child: Container(
              margin: const EdgeInsets.all(15),
              child: PieChart(
                dataMap: dataMap,
                animationDuration: const Duration(milliseconds: 800),
                chartLegendSpacing: 40,
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                initialAngleInDegree: 0,
                chartType: ChartType.disc,
                ringStrokeWidth: 32,
                legendOptions: const LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: true,
                  legendShape: BoxShape.circle,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                chartValuesOptions: const ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesInPercentage: false,
                  showChartValuesOutside: false,
                  decimalPlaces: 1,
                ),
                gradientList: gradientList,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
