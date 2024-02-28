import 'package:expence_tracker/bar%20graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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
                    color: Colors.grey[800],
                    width: 25,
                    borderRadius: BorderRadius.circular(4),
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      toY: maxY,
                      color: Colors.grey[200] 
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

Widget getBottomTitles(double value, TitleMeta meta){
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 15 
  );

  Widget text;
  switch(value.toInt()){
    case 0:
      text = '월'.text.textStyle(style).make();
      break;
    case 1:
      text = '화'.text.textStyle(style).make();
      break;
    case 2:
      text = '수'.text.textStyle(style).make();
      break;
    case 3:
      text = '목'.text.textStyle(style).make();
      break;
    case 4:
      text = '금'.text.textStyle(style).make();
      break;
    case 5:
      text = '토'.text.textStyle(style).make();
      break;
    case 6:
      text = '일'.text.textStyle(style).make();
      break;
    default:
      text = ''.text.textStyle(style).make();
      break;
  }
  return SideTitleWidget(
    child: text, 
    axisSide: meta.axisSide
  );
}