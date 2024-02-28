import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import '../bar graph/bar_graph.dart';
import '../data/expense_data.dart';
import '../datetime/date_time_helper.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startOfWeek;

  const ExpenseSummary({
    super.key, 
    required this.startOfWeek
  });

  double calculateMax(
    ExpenseData value,
    String sunday,
    String monday,
    String tuesday,
    String wednesday,
    String thursday,
    String friday,
    String saturday
  ) {

    double? max = 100;

    List<double> values = [
      value.calculateDailyExpenseSummary()[sunday] ?? 0,
      value.calculateDailyExpenseSummary()[monday] ?? 0,
      value.calculateDailyExpenseSummary()[tuesday] ?? 0,
      value.calculateDailyExpenseSummary()[wednesday] ?? 0,
      value.calculateDailyExpenseSummary()[thursday] ?? 0,
      value.calculateDailyExpenseSummary()[friday] ?? 0,
      value.calculateDailyExpenseSummary()[saturday] ?? 0,
    ];
    values.sort();
    max = values.last * 1.1;

    return max == 0 ? 100 : max;
  }

  String calculateWeekTotal(
    ExpenseData value,
    String sunday,
    String monday,
    String tuesday,
    String wednesday,
    String thursday,
    String friday,
    String saturday
  ) {

    double? max = 100;

    List<double> values = [
      value.calculateDailyExpenseSummary()[sunday] ?? 0,
      value.calculateDailyExpenseSummary()[monday] ?? 0,
      value.calculateDailyExpenseSummary()[tuesday] ?? 0,
      value.calculateDailyExpenseSummary()[wednesday] ?? 0,
      value.calculateDailyExpenseSummary()[thursday] ?? 0,
      value.calculateDailyExpenseSummary()[friday] ?? 0,
      value.calculateDailyExpenseSummary()[saturday] ?? 0,
    ];
    
    double total = 0;
    for(int i=0; i < values.length; i++){
      total +=values[i];
    }
    return total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    String sunday = convertDateTimeToString(startOfWeek.add(const Duration(days: 0)));
    String monday = convertDateTimeToString(startOfWeek.add(const Duration(days: 1)));
    String tuesday = convertDateTimeToString(startOfWeek.add(const Duration(days: 2)));
    String wednesday = convertDateTimeToString(startOfWeek.add(const Duration(days: 3)));
    String thursday = convertDateTimeToString(startOfWeek.add(const Duration(days: 4)));
    String friday = convertDateTimeToString(startOfWeek.add(const Duration(days: 5)));
    String saturday = convertDateTimeToString(startOfWeek.add(const Duration(days: 6)));

    var f = NumberFormat('###,###,###,###');
    return Consumer<ExpenseData>(
      builder: (context, value, child) => Column(
        children: [
          Row(
            children: [
              'Week Total:'.text.bold.make(),
              '${f.format(calculateMax(value, sunday, monday, tuesday, wednesday, thursday, friday, saturday))}'.text.make()
            ],
          ).p(25),

          SizedBox(
            height: 200,
            child: BarGraph(
              maxY:calculateMax(value, sunday, monday, tuesday, wednesday, thursday, friday, saturday),
              sunAmount: value.calculateDailyExpenseSummary()[sunday] ?? 00, 
              monAmount: value.calculateDailyExpenseSummary()[monday] ?? 00, 
              tueAmount: value.calculateDailyExpenseSummary()[tuesday] ?? 00, 
              wedAmount: value.calculateDailyExpenseSummary()[wednesday] ?? 00, 
              thurAmount: value.calculateDailyExpenseSummary()[thursday] ?? 00, 
              friAmount: value.calculateDailyExpenseSummary()[friday] ?? 00, 
              satAmount: value.calculateDailyExpenseSummary()[saturday] ?? 00 
            ),
          ),
        ],
      ),
    );
  }
}