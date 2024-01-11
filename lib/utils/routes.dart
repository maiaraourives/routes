// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

    if (routeName == '/home') {
      routeName = 'Tela inicial';
    } else if (routeName == '/historico') {
      routeName = 'Histórico de rotas';
    } else if (routeName == '/dados') {
      routeName = 'Dados';
    } else {
      routeName;
    }

    routeHistory.add('Rota empurrada: $routeName, acessado ${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now())}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    routeName = route.settings.name ?? 'Rota desconhecida';

    if (routeName == '/home') {
      routeName = 'Tela inicial';
    } else if (routeName == '/historico') {
      routeName = 'Histórico de rotas';
    } else if (routeName == '/dados') {
      routeName = 'Dados';
    } else {
      routeName;
    }

    routeHistory.add('Rota retirada: $routeName, acessado ${DateFormat('dd/MM/yyyy – kk:mm').format(DateTime.now())}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    routeName = newRoute?.settings.name ?? 'Rota desconhecida';

    if (routeName == '/home') {
      routeName = 'Tela inicial';
    } else if (routeName == '/historico') {
      routeName = 'Histórico de rotas';
    } else if (routeName == '/dados') {
      routeName = 'Dados';
    } else {
      routeName;
    }

    routeHistory.add('Rota substituída: $routeName, acessado ${DateFormat('dd/MM/yyyy – kk:mm').format(DateTime.now())}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    routeName = route.settings.name ?? 'Rota desconhecida';

    if (routeName == '/home') {
      routeName = 'Tela inicial';
    } else if (routeName == '/historico') {
      routeName = 'Histórico de rotas';
    } else if (routeName == '/dados') {
      routeName = 'Dados';
    } else {
      routeName;
    }

    routeHistory.add('Rota removida: $routeName, acessado ${DateFormat('dd/MM/yyyy – kk:mm').format(DateTime.now())}');
  }
}
