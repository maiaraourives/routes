import 'package:flutter/material.dart';
import 'package:routes/configs/routes/local_routes.dart';
import '../../models/contatos_model.dart';
import '../../services/navigation_service.dart';
import '../../services/service_locator.dart';
import '../../stores/list_contatos.dart';
import '../../widgets/cards/card_usuario.dart';
import '../../widgets/cs_app_bar.dart';
import '../../widgets/menu/menu.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Listas lista = getIt<Listas>();

  void _onSelect(DadosModel dados) {
    getIt<NavigationService>().pushNamed(LocalRoutes.DADOS, args: dados);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Menu(),
      appBar: const CsAppBar(
        title: 'Home',
      ),
      body: ListView.builder(
        itemCount: lista.listaContatos.length,
        itemBuilder: (context, index) {
          return CardUsuario(
            key: ValueKey(lista.listaContatos[index].nome),
            contato: lista.listaContatos[index],
            onSelect: _onSelect,
          );
        },
      ),
    );
  }
}
