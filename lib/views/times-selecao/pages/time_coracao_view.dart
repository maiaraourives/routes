import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../widgets/cs_app_bar.dart';
import '../../../widgets/cs_info_grafico.dart';

class TimeCoracaoView extends StatefulWidget {
  const TimeCoracaoView({super.key});

  @override
  State<StatefulWidget> createState() => TimeCoracaoViewState();
}

class TimeCoracaoViewState extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CsAppBar(
        title: 'Time do coração',
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 2,
                    child: PieChart(
                      PieChartData(
                        pieTouchData: PieTouchData(
                          touchCallback: (FlTouchEvent event, pieTouchResponse) {
                            setState(
                              () {
                                if (!event.isInterestedForInteractions || pieTouchResponse == null || pieTouchResponse.touchedSection == null) {
                                  touchedIndex = -1;
                                  return;
                                }
                                touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                              },
                            );
                          },
                        ),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 5,
                        centerSpaceRadius: 0,
                        sections: List.generate(
                          4,
                          (i) {
                            final isTouched = i == touchedIndex;
                            const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
                            switch (i) {
                              case 0:
                                return PieChartSectionData(
                                  color: Colors.red,
                                  value: 50,
                                  title: '50%',
                                  radius: isTouched ? 60.0 : 50.0,
                                  titleStyle: TextStyle(
                                    fontSize: isTouched ? 25.0 : 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: shadows,
                                  ),
                                );
                              case 1:
                                return PieChartSectionData(
                                  color: Colors.amber,
                                  value: 30,
                                  title: '30%',
                                  radius: isTouched ? 60.0 : 50.0,
                                  titleStyle: TextStyle(
                                    fontSize: isTouched ? 25.0 : 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: shadows,
                                  ),
                                );
                              case 2:
                                return PieChartSectionData(
                                  color: Colors.green,
                                  value: 10,
                                  title: '10%',
                                  radius: isTouched ? 60.0 : 50.0,
                                  titleStyle: TextStyle(
                                    fontSize: isTouched ? 25.0 : 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: shadows,
                                  ),
                                );
                              case 3:
                                return PieChartSectionData(
                                  color: Colors.indigo,
                                  value: 10,
                                  title: '10%',
                                  radius: isTouched ? 60.0 : 50.0,
                                  titleStyle: TextStyle(
                                    fontSize: isTouched ? 25.0 : 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: shadows,
                                  ),
                                );
                              default:
                                throw Error();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CsInfoGrafico(
                      width: touchedIndex == 0 ? 18 : 16,
                      height: touchedIndex == 0 ? 18 : 16,
                      colorContainer: touchedIndex == 0 ? Colors.red : Colors.red.withOpacity(0.3),
                      title: 'Internacional',
                      fontSize: touchedIndex == 0 ? 14 : 12,
                      color: touchedIndex == 0 ? Colors.white : Colors.grey,
                    ),
                    const SizedBox(height: 10),
                    CsInfoGrafico(
                      width: touchedIndex == 1 ? 18 : 16,
                      height: touchedIndex == 1 ? 18 : 16,
                      colorContainer: touchedIndex == 1 ? Colors.amber : Colors.amber.withOpacity(0.3),
                      title: 'Barcelona',
                      fontSize: touchedIndex == 1 ? 14 : 12,
                      color: touchedIndex == 1 ? Colors.white : Colors.grey,
                    ),
                    const SizedBox(height: 10),
                    CsInfoGrafico(
                      width: touchedIndex == 2 ? 18 : 16,
                      height: touchedIndex == 2 ? 18 : 16,
                      colorContainer: touchedIndex == 1 ? Colors.green : Colors.green.withOpacity(0.3),
                      title: 'Inter de Milão',
                      fontSize: touchedIndex == 2 ? 14 : 12,
                      color: touchedIndex == 2 ? Colors.white : Colors.grey,
                    ),
                    const SizedBox(height: 10),
                    CsInfoGrafico(
                      width: touchedIndex == 3 ? 18 : 16,
                      height: touchedIndex == 3 ? 18 : 16,
                      colorContainer: touchedIndex == 3 ? Colors.indigo : Colors.indigo.withOpacity(0.3),
                      title: 'Tigres',
                      fontSize: touchedIndex == 3 ? 14 : 12,
                      color: touchedIndex == 3 ? Colors.white : Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
