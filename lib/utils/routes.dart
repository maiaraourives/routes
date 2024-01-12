// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../configs/routes/local_routes.dart';

class RouteObserverr extends NavigatorObserver {
  List<String> routeHistory = [];

  String routeName = '';

  String action = '';

  String dateFormat = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());

  void removeRoute(String routeName) {
    routeHistory.removeWhere((route) => route.contains(routeName));
  }

  String mapRouteName(String inputRouteName) {
    switch (inputRouteName) {
      case '/':
        return 'Inicialização';
      case LocalRoutes.HOME:
        return 'Tela inicial';
      case LocalRoutes.HISTORICO:
        return 'Histórico de rotas';
      case LocalRoutes.DADOS:
        return 'Dados';
      case LocalRoutes.TIMES_SELECAO:
        return 'Times e seleção';
      case LocalRoutes.SELCAO_CORACAO:
        return 'Seleção do coração';
      case LocalRoutes.TIMES_CORACAO:
        return 'Times do coração';
      case LocalRoutes.FAMILIA:
        return 'Família';
      case LocalRoutes.FILHO:
        return 'Filho';
      case LocalRoutes.MORA_COM:
        return 'Mora com';
      case LocalRoutes.VIAGEM:
        return 'Viagem favorita';
      case LocalRoutes.TEM_IRMAO:
        return 'Tem irmão';
      case LocalRoutes.FRUTA_FAVORITA:
        return 'Fruta favorita';
      default:
        return inputRouteName;
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute, {String? contatoNome}) {
    super.didPush(route, previousRoute);

    routeName = route.settings.name ?? 'Rota desconhecida';

    routeName = mapRouteName(routeName);

    // action = 'Rota empurrada';

    // routeHistory.add('$action: $routeName, acessado $dateFormat');

    routeHistory.add(routeName);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);

    routeName = route.settings.name ?? 'Rota desconhecida';

    routeName = mapRouteName(routeName);

    // action = 'Rota retirada';

    // routeHistory.add('$action: $routeName, acessado $dateFormat');

    // routeHistory.add(routeName);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);

    routeName = newRoute?.settings.name ?? 'Rota desconhecida';

    routeName = mapRouteName(routeName);

    // action = 'Rota substituída';

    // routeHistory.add('$action: $routeName, acessado $dateFormat');

    // routeHistory.add(routeName);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);

    routeName = route.settings.name ?? 'Rota desconhecida';

    routeName = mapRouteName(routeName);

    // action = 'Rota removida';

    // routeHistory.add('$action: $routeName, acessado $dateFormat');

    // routeHistory.add(routeName);
  }
}
