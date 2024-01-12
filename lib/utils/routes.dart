// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../configs/routes/local_routes.dart';

class RouteObserverr extends NavigatorObserver {
  List<String> routeHistory = [];

  String routeName = '';

  void removeRoute(String routeName) {
    routeHistory.removeWhere((route) => route.contains(routeName));
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute, {String? contatoNome}) {
    super.didPush(route, previousRoute);

    routeName = route.settings.name ?? 'Rota desconhecida';

    routeName = LocalRoutes.mapRouteNameCustom(routeName);

    routeHistory.add(routeName);
  }

  // @override
  // void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
  //   super.didPop(route, previousRoute);

  //   routeName = route.settings.name ?? 'Rota desconhecida';

  //   routeName = LocalRoutes.mapRouteNameCustom(routeName);
  // }

  // @override
  // void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
  //   super.didReplace(newRoute: newRoute, oldRoute: oldRoute);

  //   routeName = newRoute?.settings.name ?? 'Rota desconhecida';

  //   routeName = LocalRoutes.mapRouteNameCustom(routeName);
  // }

  // @override
  // void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
  //   super.didRemove(route, previousRoute);

  //   routeName = route.settings.name ?? 'Rota desconhecida';

  //   routeName = LocalRoutes.mapRouteNameCustom(routeName);
  // }
}
