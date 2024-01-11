import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../widgets/cs_app_bar.dart';

class ViagemViewView extends StatefulWidget {
  const ViagemViewView({super.key});

  @override
  State<ViagemViewView> createState() => _ViagemViewViewState();
}

class _ViagemViewViewState extends State<ViagemViewView> {
  Map<String, double> dataMap = {
    'Angra dos Reis - SP': 1,
    'Milão - Itália': 1,
    'Santa Cruz - RS': 1,
    'São Paulo - SP': 3,
    'Posadas - Argentina': 2,
    'Cancún - México': 1,
    'Roma - Itália': 1,
  };

  final gradientList = <List<Color>>[
    [
      Colors.blueAccent,
      Colors.blueAccent.withOpacity(0.5),
    ],
    [
      Colors.redAccent,
      Colors.redAccent.withOpacity(0.5),
    ],
    [
      Colors.amberAccent,
      Colors.amberAccent.withOpacity(0.5),
    ],
    [
      Colors.pinkAccent,
      Colors.pinkAccent.withOpacity(0.5),
    ],
    [
      Colors.cyanAccent,
      Colors.cyanAccent.withOpacity(0.5),
    ],
    [
      Colors.yellowAccent,
      Colors.yellowAccent.withOpacity(0.5),
    ],
    [
      Colors.purple,
      Colors.purpleAccent.withOpacity(0.5),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CsAppBar(
        title: 'Viagem favorita com a família',
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Flexible(
            child: Container(
              margin: const EdgeInsets.all(15),
              child: PieChart(
                dataMap: dataMap,
                animationDuration: const Duration(milliseconds: 800),
                chartLegendSpacing: 40,
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                initialAngleInDegree: 0,
                chartType: ChartType.disc,
                ringStrokeWidth: 32,
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
                  showChartValuesOutside: false,
                  decimalPlaces: 1,
                ),
                gradientList: gradientList,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
