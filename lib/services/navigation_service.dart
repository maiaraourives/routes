import 'package:flutter/material.dart';

class NavigationService {
  final navigatorKey = GlobalKey<NavigatorState>();
  final RouteObserver<PageRoute<dynamic>> routeObserver = RouteObserver<PageRoute<dynamic>>();

  Future<dynamic> pushNamed(
    String route, {
    Object? args,
  }) async {
    return await Future.delayed(Duration.zero, () async {
      return await navigatorKey.currentState!.pushNamed(
        route,
        arguments: args,
      );
    });
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String route, {
    Object? args,
  }) async {
    return await Future.delayed(Duration.zero, () async {
      return await navigatorKey.currentState!.pushNamedAndRemoveUntil(
        route,
        (route) => false,
        arguments: args,
      );
    });
  }

  Future<dynamic> popAndPushNamed(
    String route, {
    Object? args,
  }) async {
    return await Future.delayed(Duration.zero, () async {
      return await navigatorKey.currentState!.popAndPushNamed(
        route,
        arguments: args,
      );
    });
  }

  void pop<T>([T? args]) {
    navigatorKey.currentState!.pop(args);
  }

  Future<dynamic> showModal({
    required Widget child,
  }) async {
    return await navigatorKey.currentState!.push(
      PageRouteBuilder(
        barrierDismissible: true,
        opaque: false,
        fullscreenDialog: true,
        transitionDuration: const Duration(milliseconds: 800),
        pageBuilder: (_, __, ___) {
          return child;
        },
      ),
    );
  }

  void setupRoutes() {
    navigatorKey.currentState!.widget.observers.add(routeObserver);
  }
}
