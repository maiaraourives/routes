import 'package:flutter/material.dart';

import '../../configs/routes/local_routes.dart';
import '../../services/service_locator.dart';
import '../../utils/routes.dart';
import '../cs_list_tile.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  RouteObserverr routeObserver = getIt<RouteObserverr>();

  void removeRoute(routeName) {
    setState(() {
      if (routeName.isNotEmpty) {
        routeObserver.removeRoute(routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.16,
            width: double.infinity,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              boxShadow: const [
                BoxShadow(
                  color: Color(0x23000000),
                  offset: Offset(3, 3),
                  blurRadius: 3,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10).copyWith(top: 35),
              child: Row(
                children: [
                  // Foto do usuário
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.network(
                        'https://img.freepik.com/fotos-premium/ilustracao-de-linda-garota_1022212-260.jpg?size=626&ext=jpg&ga=GA1.1.1546980028.1704240000&semt=ais',
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Luana Correa',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '(55) 55 9 9845-9712',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          CsListTile(
            title: 'Times e Seleções',
            icon: Icons.sports,
            onTap: () {
              Navigator.pushNamed(context, LocalRoutes.TIMES_SELECAO);
              removeRoute('Inicialização');
            },
          ),
          CsListTile(
            title: 'Família',
            icon: Icons.family_restroom_rounded,
            onTap: () {
              Navigator.pushNamed(context, LocalRoutes.FAMILIA);
              removeRoute('Inicialização');
            },
          ),
          CsListTile(
            title: 'Fruta favorita',
            icon: Icons.apple,
            onTap: () {
              Navigator.pushNamed(context, LocalRoutes.FRUTA_FAVORITA);
              removeRoute('Inicialização');
            },
          ),
          // CsListTile(
          //   title: 'Histórico',
          //   icon: Icons.history,
          //   onTap: () => Navigator.pushNamed(context, LocalRoutes.HISTORICO),
          // ),
        ],
      ),
    );
  }
}
