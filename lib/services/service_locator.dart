import 'package:get_it/get_it.dart';

import '../stores/list_contatos.dart';
import '../utils/routes.dart';
import 'navigation_service.dart';

final getIt = GetIt.instance;

///Registra todas as [Stores] utilizadas pelo app
setupServiceLocator({bool firstTime = true}) {
  _registerSingleton<NavigationService>(
    instance: NavigationService(),
    allowAgain: false,
    firstTime: firstTime,
  );
  
  _registerSingleton<RouteObserverr>(
    instance: RouteObserverr(),
    allowAgain: false,
    firstTime: firstTime,
  );
  
  _registerSingleton<Listas>(
    instance: Listas(),
    allowAgain: false,
    firstTime: firstTime,
  );
}

void _registerSingleton<T extends Object>({
  required T instance,
  required bool allowAgain,
  required bool firstTime,
}) {
  if (!allowAgain) {
    if (!firstTime) {
      return;
    }
  }

  getIt.registerSingleton<T>(instance);
}
