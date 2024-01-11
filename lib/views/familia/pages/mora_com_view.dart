import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../widgets/cs_app_bar.dart';

class MoraComView extends StatefulWidget {
  const MoraComView({super.key});

  @override
  State<MoraComView> createState() => _MoraComViewState();
}

class _MoraComViewState extends State<MoraComView> {
  Map<String, double> dataMap = {
    'Sozinha': 3,
    'Noivo': 1,
    'Pais': 1,
    'Esposo': 1,
    'Esposa': 2,
    'Esposa e filhos': 2,
  };

  final colorList = <Color>[
    Colors.blueAccent,
    Colors.redAccent,
    Colors.pinkAccent,
    Colors.amberAccent,
    Colors.cyanAccent,
    Colors.yellowAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CsAppBar(
        title: 'Mora com',
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Flexible(
            child: Container(
              margin: const EdgeInsets.all(15),
              child: PieChart(
                chartType: ChartType.ring,
                dataMap: dataMap,
                animationDuration: const Duration(milliseconds: 800),
                chartLegendSpacing: 32,
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                colorList: colorList,
                initialAngleInDegree: 0,
                ringStrokeWidth: 32,
                centerText: 'Mora',
                legendOptions: const LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: true,
                  legendShape: BoxShape.circle,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                chartValuesOptions: const ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesInPercentage: false,
                  showChartValuesOutside: true,
                  decimalPlaces: 1,
                ),
                // gradientList: ---To add gradient colors---
                // emptyColorGradient: ---Empty Color gradient---
              ),
            ),
          ),
        ],
      ),
    );
  }
}
