// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';

import 'views/familia/familia_view.dart';
import 'views/familia/pages/filho_view.dart';
import 'views/familia/pages/mora_com_view.dart';
import 'views/familia/pages/tem_irmaos_view.dart';
import 'views/familia/pages/viagem_view.dart';
import 'views/historico/historico_view.dart';
import 'configs/routes/local_routes.dart';
import 'models/contatos_model.dart';
import 'views/dados/dados_view.dart';
import 'views/fruta-favorita/fruta_favorita_view.dart';
import 'views/home/home_view.dart';
import 'views/times-selecao/pages/selecao_coracao_view.dart';
import 'views/times-selecao/pages/time_coracao_view.dart';
import 'views/times-selecao/times_selecao_view.dart';
import 'widgets/cs_app_bar.dart';
import 'widgets/cs_elevated_button.dart';
import 'widgets/nenhuma_informacao.dart';

class RouterApp {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LocalRoutes.HOME:
        return _PageBuilder(
          child: const HomeView(),
          settings: settings,
        );

      case LocalRoutes.HISTORICO:
        return _PageBuilder(
          child: const HistoricoView(),
          settings: settings,
        );

      case LocalRoutes.DADOS:
        final dados = settings.arguments as DadosModel;

        return _PageBuilder(
          child: DadosView(dados: dados),
          settings: settings,
        );

      case LocalRoutes.TIMES_SELECAO:
        return _PageBuilder(
          child: const TimesSelecaoView(),
          settings: settings,
        );

      case LocalRoutes.SELCAO_CORACAO:
        return _PageBuilder(
          child: const SelecaoCoracaoView(),
          settings: settings,
        );

      case LocalRoutes.TIMES_CORACAO:
        return _PageBuilder(
          child: const TimeCoracaoView(),
          settings: settings,
        );

      case LocalRoutes.FAMILIA:
        return _PageBuilder(
          child: const FamiliaView(),
          settings: settings,
        );

      case LocalRoutes.FILHO:
        return _PageBuilder(
          child: const FilhoView(),
          settings: settings,
        );

      case LocalRoutes.MORA_COM:
        return _PageBuilder(
          child: const MoraComView(),
          settings: settings,
        );

      case LocalRoutes.VIAGEM:
        return _PageBuilder(
          child: const ViagemViewView(),
          settings: settings,
        );

      case LocalRoutes.TEM_IRMAO:
        return _PageBuilder(
          child: const TemIrmaoView(),
          settings: settings,
        );

      case LocalRoutes.FRUTA_FAVORITA:
        return _PageBuilder(
          child: const FrutaFavoritaView(),
          settings: settings,
        );

      default:
        return _PageBuilder(
          child: const _RotaInexistenteView(),
          settings: settings,
        );
    }
  }
}

class _PageBuilder extends PageRouteBuilder {
  _PageBuilder({
    required this.child,
    required this.settings,
  }) : super(
          settings: settings,
          transitionDuration: const Duration(milliseconds: 500),
          reverseTransitionDuration: const Duration(milliseconds: 100),
          pageBuilder: (context, animation, secAnimation) => child,
        );

  final Widget child;

  @override
  final RouteSettings settings;
}

class _RotaInexistenteView extends StatelessWidget {
  const _RotaInexistenteView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CsAppBar(title: 'Ops! Ocorreu um erro'),
      body: Center(
        child: SingleChildScrollView(
          child: NenhumaInformacao(
            Image.network('https://thecolor.blog/wp-content/uploads/2021/10/GIF-1.gif', width: double.maxFinite, height: 400),
            message: 'Desculpe, a página que você está procurando não foi encontrada. Relate o seu problema abrindo um chamado no botão abaixo!',
            actions: [
              CsElevatedButton(
                height: 35,
                width: MediaQuery.of(context).size.width * 0.8,
                label: 'Abrir chamado',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RotaErrorWidgetView extends StatelessWidget {
  const RotaErrorWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: NenhumaInformacao(
            Image.network('https://thecolor.blog/wp-content/uploads/2021/10/GIF-1.gif', width: double.maxFinite, height: 400),
            message: 'Ocorreu um problema desconhecido. Ajude a equipe de desenvolvimento abrindo um chamado no botão abaixo',
            actions: [
              CsElevatedButton(
                height: 35,
                width: MediaQuery.of(context).size.width * 0.8,
                label: 'Abrir chamado',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
