import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'bar_data.dart';

class BarGraph extends StatelessWidget {
  final double? maxY;
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;

  const BarGraph({
    super.key, 
    this.maxY, 
    required this.sunAmount, 
    required this.monAmount, 
    required this.tueAmount, 
    required this.wedAmount, 
    required this.thurAmount, 
    required this.friAmount, 
    required this.satAmount
  });

  @override
  Widget build(BuildContext context) {

    BarData myBarData = BarData(
      sunAmount: sunAmount,
      monAmount: monAmount,
      tueAmount: tueAmount,
      wedAmount: wedAmount,
      thurAmount: thurAmount,
      friAmount: friAmount,
      satAmount: satAmount      
    );
    myBarData.initializeBarData();

    return BarChart(
      BarChartData(
        maxY: maxY, 
        minY: 0,
        titlesData: const FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getBottomTitles,
              reservedSize: 30
            )
          )
        ),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: myBarData.barData
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                    toY: data.y,
                    color: Theme.of(context).colorScheme.primary,
                    width: 25,
                    borderRadius: BorderRadius.circular(5),
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      toY: maxY,
                      color: Theme.of(context).colorScheme.secondary
                    )
                  ),
                ]
              )
            )
            .toList(),
      )
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color.fromARGB(255, 127, 127, 127),
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );

  String getTitleText(int dayIndex) {
    switch (dayIndex) {
      case 0:
        return '월';
      case 1:
        return '화';
      case 2:
        return '수';
      case 3:
        return '목';
      case 4:
        return '금';
      case 5:
        return '토';
      case 6:
        return '일';
      default:
        return '';
    }
  }

  String text = getTitleText(value.toInt());
  Widget sideTitleWidget = SideTitleWidget(
    axisSide: meta.axisSide,
    child: text.text.textStyle(style).make(),
  );

  return sideTitleWidget;
}
