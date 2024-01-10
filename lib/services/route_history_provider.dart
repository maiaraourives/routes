import 'package:flutter/material.dart';

class RouteHistoryProvider extends ChangeNotifier {
  final List<String> _routeHistory = [];

  List<String> get routeHistory => _routeHistory.toList();

  void addToHistory(String route) {
    _routeHistory.add(route);
    notifyListeners();
  }
}
