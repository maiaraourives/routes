import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Menu(),
      appBar: const CsAppBar(
        title: 'Home',
      ),
      body: ListView.builder(
        itemCount: lista.listaContatoss.length,
        itemBuilder: (context, index) {
          return CardUsuario(
            key: ValueKey(lista.listaContatoss[index].nome),
            nome: lista.listaContatoss[index].nome,
            numero: lista.listaContatoss[index].numero,
            perfil: lista.listaContatoss[index].perfil,
          );
        },
      ),
    );
  }
}
