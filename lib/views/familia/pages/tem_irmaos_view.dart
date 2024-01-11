import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../widgets/cs_app_bar.dart';

class TemIrmaoView extends StatefulWidget {
  const TemIrmaoView({super.key});

  @override
  State<TemIrmaoView> createState() => _TemIrmaoViewState();
}

class _TemIrmaoViewState extends State<TemIrmaoView> {
  final dataMap = <String, double>{
    '0': 2,
    '1': 1,
    '2': 4,
    '3': 1,
    '4': 1,
    '6': 1,
  };

  final colorList = <Color>[
    Colors.blueAccent,
    Colors.redAccent,
    Colors.amberAccent,
    Colors.pinkAccent,
    Colors.cyanAccent,
    Colors.yellowAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CsAppBar(
        title: 'Tem irmãos',
      ),
      body: Column(
        children: [
          Flexible(
            child: Container(
              margin: const EdgeInsets.all(15),
              child: PieChart(
                dataMap: dataMap,
                chartType: ChartType.ring,
                baseChartColor: Colors.grey.shade400.withOpacity(0.15),
                colorList: colorList,
                chartValuesOptions: const ChartValuesOptions(
                  showChartValuesInPercentage: false,
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesOutside: false,
                ),
                totalValue: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
