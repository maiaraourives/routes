import 'package:animated_pie_chart/animated_pie_chart.dart';
import 'package:flutter/material.dart';

import '../../widgets/cs_app_bar.dart';

class FrutaFavoritaView extends StatefulWidget {
  const FrutaFavoritaView({super.key});

  @override
  State<FrutaFavoritaView> createState() => _FrutaFavoritaViewState();
}

class _FrutaFavoritaViewState extends State<FrutaFavoritaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CsAppBar(
        title: 'Fruta favorita',
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Flexible(
            child: Container(
              margin: const EdgeInsets.all(15),
              child: AnimatedPieChart(
                sort: true,
                stokeWidth: 8.0,
                padding: 3.0,
                animatedSpeed: 500,
                pieRadius: 70.0,
                colorsList: const [
                  Colors.green,
                  Colors.yellow,
                  Colors.red,
                  Colors.purple,
                  Colors.amber,
                  Colors.brown,
                ],
                pieData: [
                  for (int i = 0; i < pieChartList.length; i++)
                    MdPieChart(
                      value: pieChartList[i].value,
                      name: pieChartList[i].name,
                    )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<MdPieChart> pieChartList = [
    MdPieChart(value: 30, name: 'Kiwi'),
    MdPieChart(value: 10, name: 'Uva'),
    MdPieChart(value: 10, name: 'Manga'),
    MdPieChart(value: 20, name: 'Maça'),
    MdPieChart(value: 10, name: 'Pera'),
    MdPieChart(value: 20, name: 'Melancia'),
  ];
}
