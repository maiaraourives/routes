// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RouteObserverr extends NavigatorObserver {
  List<String> routeHistory = [];

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    String routeName = route.settings.name ?? "Unknown Route";

    if (routeName == '/home') {
      routeName = 'Tela inicial';
    } else if (routeName == '/historico') {
      routeName = 'Histórico de rotas';
    } else {
      routeName;
    }

    routeHistory.add('Rota empurrada: $routeName, ${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now())}');

    print('Rota empurrada: $routeName, acessado ${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now())}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    String routeName = route.settings.name ?? "Unknown Route";

    if (routeName == '/home') {
      routeName = 'Tela inicial';
    } else if (routeName == '/historico') {
      routeName = 'Histórico de rotas';
    } else {
      routeName;
    }

    routeHistory.add('Rota retirada: $routeName, acessado ${DateFormat('dd/MM/yyyy – kk:mm').format(DateTime.now())}');

    print('Rota retirada: $routeName, acessado ${DateFormat('dd/MM/yyyy – kk:mm').format(DateTime.now())}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    String newRouteName = newRoute?.settings.name ?? "Unknown Route";

    if (newRouteName == '/home') {
      newRouteName = 'Tela inicial';
    } else if (newRouteName == '/historico') {
      newRouteName = 'Histórico de rotas';
    } else {
      newRouteName;
    }

    routeHistory.add('Rota substituída: $newRouteName, acessado ${DateFormat('dd/MM/yyyy – kk:mm').format(DateTime.now())}');

    print('Rota substituída: $newRouteName, acessado ${DateFormat('dd/MM/yyyy – kk:mm').format(DateTime.now())}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    String removeRouteName = route.settings.name ?? "Unknown Route";

    if (removeRouteName == '/home') {
      removeRouteName = 'Tela inicial';
    } else if (removeRouteName == '/historico') {
      removeRouteName = 'Histórico de rotas';
    } else {
      removeRouteName;
    }

    routeHistory.add('Rota removida: $removeRouteName, acessado ${DateFormat('dd/MM/yyyy – kk:mm').format(DateTime.now())}');

    print('Rota removida: $removeRouteName, acessado ${DateFormat('dd/MM/yyyy – kk:mm').format(DateTime.now())}');
  }
}
