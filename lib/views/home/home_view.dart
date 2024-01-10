import 'package:flutter/material.dart';
import '../../widgets/cs_app_bar.dart';
import '../../widgets/menu/menu.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: Menu(),
      appBar: CsAppBar(
        title: 'Home',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }
}