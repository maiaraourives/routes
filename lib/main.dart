import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'configs/constants.dart';
import 'configs/routes/local_routes.dart';
import 'configs/themes/theme_app.dart';
import 'router_app.dart';
import 'services/navigation_service.dart';
import 'services/route_history_provider.dart';
import 'services/service_locator.dart';
import 'utils/routes.dart';
import 'widgets/no_glow_effect.dart';

void main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await setupServiceLocator();

      //Bloqueia a orientação do dispositivo como "Somente Retrato"
      SystemChrome.setPreferredOrientations(const [DeviceOrientation.portraitUp]);

      //Rota de erro(Para não aparecer o erro de tela vermelha para o usuário)
      ErrorWidget.builder = (errorDetails) {
        return const RotaErrorWidgetView();
      };

      runApp(const Routes());
    },
    (error, stackTrack) {},
  );
}

class Routes extends StatelessWidget {
  const Routes({super.key});


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RouteHistoryProvider>(
          create: (_) => RouteHistoryProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: App.NAME,
        themeMode: ThemeMode.light,
        theme: ThemeApp.ligthTheme,
        color: theme.scaffoldBackgroundColor,
        navigatorKey: getIt<NavigationService>().navigatorKey,
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: const NoGlowEffect(),
            child: child!,
          );
        },
        initialRoute: LocalRoutes.HOME,
        onGenerateRoute: RouterApp.onGenerateRoute,
        navigatorObservers: [getIt<RouteObserverr>()],
      ),
    );
  }
}
