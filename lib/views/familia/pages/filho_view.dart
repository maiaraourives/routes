import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../widgets/cs_app_bar.dart';

class FilhoView extends StatefulWidget {
  const FilhoView({super.key});

  @override
  State<FilhoView> createState() => _FilhoViewState();
}

class _FilhoViewState extends State<FilhoView> {
  Map<String, double> dataMap = {
    'Sim': 3,
    'Não': 7,
  };

  final colorList = <Color>[
    Colors.blue,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CsAppBar(
        title: 'Tem filho',
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Flexible(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: PieChart(
                dataMap: dataMap,
                animationDuration: const Duration(milliseconds: 800),
                chartLegendSpacing: 32,
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                colorList: colorList,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
