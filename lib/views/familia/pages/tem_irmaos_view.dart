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

class TemIrmaoView extends StatefulWidget {
  const TemIrmaoView({super.key});

  @override
  State<TemIrmaoView> createState() => _TemIrmaoViewState();
}

class _TemIrmaoViewState extends State<TemIrmaoView> {
  RouteObserverr routeObserver = getIt<RouteObserverr>();

  void removeRoute(routeName) {
    setState(() {
      if (routeName.isNotEmpty) {
        routeObserver.removeRoute(routeName);
      }
    });
  }

  final dataMap = <String, double>{
    '0': 2,
    '1': 1,
    '2': 4,
    '3': 1,
    '4': 1,
    '6': 1,
  };

  final colorList = <Color>[
    Colors.blueAccent,
    Colors.redAccent,
    Colors.amberAccent,
    Colors.pinkAccent,
    Colors.cyanAccent,
    Colors.yellowAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CsAppBar(
        title: 'Tem irmãos',
        leading: CsIconButton(
          icon: const CsIcon.icon(icon: Icons.arrow_back, color: Colors.white),
          onPressed: () {
            removeRoute('Família');
            removeRoute('Tem irmão');
            Navigator.pushNamed(context, LocalRoutes.FAMILIA);
          },
        ),
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
              child: PieChart(
                dataMap: dataMap,
                chartType: ChartType.ring,
                baseChartColor: Colors.grey.shade400.withOpacity(0.15),
                colorList: colorList,
                chartValuesOptions: const ChartValuesOptions(
                  showChartValuesInPercentage: false,
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesOutside: false,
                ),
                totalValue: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
