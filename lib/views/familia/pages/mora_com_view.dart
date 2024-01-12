// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../services/navigation_service.dart';
import '../../../services/service_locator.dart';
import '../../../utils/routes.dart';
import '../../../widgets/cs_app_bar.dart';
import '../../../widgets/cs_icon.dart';
import '../../../widgets/cs_icon_button.dart';

class MoraComView extends StatefulWidget {
  const MoraComView({super.key});

  @override
  State<MoraComView> createState() => _MoraComViewState();
}

class _MoraComViewState extends State<MoraComView> {
  RouteObserverr routeObserver = getIt<RouteObserverr>();

  void removeRoute(routeName) {
    setState(() {
      if (routeName.isNotEmpty) {
        routeObserver.removeRoute(routeName);
      }
    });
  }

  Map<String, double> dataMap = {
    'Sozinha': 2,
    'Noivo': 1,
    'Pais': 2,
    'Esposa': 3,
    'Esposa e filhos': 2,
  };

  final colorList = <Color>[
    Colors.blueAccent,
    Colors.redAccent,
    Colors.pinkAccent,
    Colors.amberAccent,
    Colors.cyanAccent,
    Colors.yellowAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CsAppBar(
        title: 'Mora com',
        leading: CsIconButton(
          icon: const CsIcon.icon(icon: Icons.arrow_back, color: Colors.white),
          onPressed: () {
            getIt<NavigationService>().pop();
            removeRoute('Mora com');
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
          Flexible(
            child: Container(
              margin: const EdgeInsets.all(15),
              child: PieChart(
                chartType: ChartType.ring,
                dataMap: dataMap,
                animationDuration: const Duration(milliseconds: 800),
                chartLegendSpacing: 32,
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                colorList: colorList,
                initialAngleInDegree: 0,
                ringStrokeWidth: 32,
                centerText: 'Mora',
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
                  showChartValuesOutside: true,
                  decimalPlaces: 1,
                ),
                // gradientList: ---To add gradient colors---
                // emptyColorGradient: ---Empty Color gradient---
              ),
            ),
          ),
        ],
      ),
    );
  }
}
