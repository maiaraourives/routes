import 'package:flutter/material.dart';
import 'package:routes/widgets/cs_app_bar.dart';

class HistoricoView extends StatefulWidget {
  const HistoricoView({Key? key}) : super(key: key);

  @override
  State<HistoricoView> createState() => _HistoricoViewState();
}

class _HistoricoViewState extends State<HistoricoView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CsAppBar(title: 'Histórico'),
      body: Text('Barbaridade')
      // ListView.builder(
      //   itemCount: teste.routeHistory.length,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       title: Text(
      //         teste.routeHistory[index],
      //         style: const TextStyle(color: Colors.blue),
      //       ),
      //     );
      //   },
      // )
      ,
    );
  }
}
