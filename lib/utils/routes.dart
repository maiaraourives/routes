// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../configs/routes/local_routes.dart';

class RouteObserverr extends NavigatorObserver {
  List<String> routeHistory = [];

  void removeRoute(String routeName) {
    routeHistory.removeWhere((route) => route.contains(routeName));
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute, {String? contatoNome}) {
    super.didPush(route, previousRoute);

    final routePath = route.settings.name ?? 'Rota desconhecida';

    final routeName = LocalRoutes.mapRouteNameCustom(routePath);

    routeHistory.add(routeName);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    final routeName = LocalRoutes.mapRouteNameCustom(route.settings.name!);
    routeHistory.removeWhere((r) => r.contains(routeName));

    super.didPop(route, previousRoute);
  }
}
