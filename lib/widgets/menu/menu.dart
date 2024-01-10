import 'package:flutter/material.dart';

import '../../configs/routes/local_routes.dart';
import '../cs_icon.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
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
              color: theme.appBarTheme.backgroundColor,
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
              child: const Row(
                children: [],
              ),
            ),
          ),
          ListTile(
            splashColor: Colors.grey[200],
            leading: const CsIcon.icon(
              icon: Icons.home,
              color: Colors.blueGrey,
            ),
            title: const Text(
              'Home',
              style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.w400,
                fontSize: 18,
                shadows: [
                  Shadow(
                    blurRadius: 2,
                    color: Color(0x5DA7A7A7),
                    offset: Offset(1, 1),
                  ),
                ],
              ),
            ),
            onTap: () => Navigator.pushNamed(context, LocalRoutes.HOME),
          ),
          ListTile(
            splashColor: Colors.grey[200],
            leading: const CsIcon.icon(
              icon: Icons.history,
              color: Colors.blueGrey,
            ),
            title: const Text(
              'Historico',
              style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.w400,
                fontSize: 18,
                shadows: [
                  Shadow(
                    blurRadius: 2,
                    color: Color(0x5DA7A7A7),
                    offset: Offset(1, 1),
                  ),
                ],
              ),
            ),
            onTap: () => Navigator.pushNamed(context, LocalRoutes.HISTORICO),
          ),
        ],
      ),
    );
  }
}
