// ignore_for_file: constant_identifier_names

class LocalRoutes {
  // static const SPLASH_SCREEN = '/splash-screen';

  static const HOME = '/home';

  static const HISTORICO = '/historico';

  static const DADOS = '/dados';

  static const TIMES_SELECAO = '/times-selecao';

  static const SELCAO_CORACAO = '/selecao-coracao';

  static const TIMES_CORACAO = '/times-coracao';

  static const FAMILIA = '/familia';

  static const FILHO = '/filho';

  static const MORA_COM = '/mora-com';

  static const VIAGEM = '/viagem';

  static const TEM_IRMAO = '/tem-irmao';

  static const FRUTA_FAVORITA = '/fruta-favorita';

  static String mapRouteNameCustom(String inputRouteName) {
    // Adicione mapeamentos personalizados para todas as rotas, se necessário
    switch (inputRouteName) {
      case '/':
        return 'Inicialização';
      case HOME:
        return 'Tela inicial';
      case HISTORICO:
        return 'Histórico de rotas';
      case DADOS:
        return 'Dados';
      case TIMES_SELECAO:
        return 'Times e seleção';
      case SELCAO_CORACAO:
        return 'Seleção do coração';
      case TIMES_CORACAO:
        return 'Times do coração';
      case FAMILIA:
        return 'Família';
      case FILHO:
        return 'Filho';
      case MORA_COM:
        return 'Mora com';
      case VIAGEM:
        return 'Viagem favorita';
      case TEM_IRMAO:
        return 'Tem irmão';
      case FRUTA_FAVORITA:
        return 'Fruta favorita';
      default:
        return inputRouteName;
    }
  }

  static String mapRouteName(String inputRouteName) {
    // Adicione mapeamentos personalizados para todas as rotas, se necessário
    switch (inputRouteName) {
      case '/':
        return 'Inicialização';
      case 'Tela inicial':
        return HOME;
      case 'Histórico de rotas':
        return HISTORICO;
      case 'Dados':
        return DADOS;
      case 'Times e seleção':
        return TIMES_SELECAO;
      case 'Seleção do coração':
        return SELCAO_CORACAO;
      case 'Times do coração':
        return TIMES_CORACAO;
      case 'Família':
        return FAMILIA;
      case 'Filho':
        return FILHO;
      case 'Mora com':
        return MORA_COM;
      case 'Viagem favorita':
        return VIAGEM;
      case 'Tem irmão':
        return TEM_IRMAO;
      case 'Fruta favorita':
        return FRUTA_FAVORITA;
      default:
        return inputRouteName;
    }
  }
}
