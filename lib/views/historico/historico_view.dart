import 'package:flutter/material.dart';
import 'package:routes/widgets/cs_app_bar.dart';

import '../../services/service_locator.dart';
import '../../utils/routes.dart';

class HistoricoView extends StatefulWidget {
  const HistoricoView({Key? key}) : super(key: key);

  @override
  State<HistoricoView> createState() => _HistoricoViewState();
}

class _HistoricoViewState extends State<HistoricoView> {
  RouteObserverr routeObserver = getIt<RouteObserverr>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CsAppBar(title: 'Histórico'),
      body: ListView.builder(
        itemCount: routeObserver.routeHistory.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              routeObserver.routeHistory[index],
              style: const TextStyle(color: Colors.blue),
            ),
          );
        },
      ),
    );
  }
}
