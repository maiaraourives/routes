// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:routes/widgets/cs_app_bar.dart';

import '../../services/service_locator.dart';
import '../../utils/routes.dart';
import '../../widgets/cs_icon.dart';
import '../../widgets/cs_icon_button.dart';
import '../../widgets/cs_text_form_field.dart';

class HistoricoView extends StatefulWidget {
  const HistoricoView({super.key});

  @override
  State<HistoricoView> createState() => _HistoricoViewState();
}

class _HistoricoViewState extends State<HistoricoView> {
  RouteObserverr routeObserver = getIt<RouteObserverr>();

  ///[Controllers]
  final _routeController = TextEditingController();

  void removeRoute(String routeName) {
    setState(() {
      if (routeName.isNotEmpty) {
        routeObserver.removeRoute(routeName);
        _routeController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CsAppBar(title: 'Histórico'),
      body: Column(
        children: [
          CsTextFormField(
            hintText: 'Digite a rota que deseja remover',
            controller: _routeController,
            suffixIcon: CsIconButton(
              icon: const CsIcon.icon(icon: Icons.delete, color: Colors.white),
              onPressed: () {
                removeRoute(_routeController.text);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: routeObserver.routeHistory.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    routeObserver.routeHistory[index],
                    style: const TextStyle(color: Colors.blueGrey),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
