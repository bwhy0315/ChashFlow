import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import '../bar graph/bar_graph.dart';
import '../data/expense_data.dart';
import '../datetime/date_time_helper.dart';
import 'espense_calculate.dart';
import 'expese_total_row.dart';

class ExpenseSummary extends StatefulWidget {
  final DateTime startOfWeek;

  const ExpenseSummary({
    Key? key, 
    required this.startOfWeek
  }) : super(key: key);

  @override
  _ExpenseSummaryState createState() => _ExpenseSummaryState();
}

class _ExpenseSummaryState extends State<ExpenseSummary> {
  bool isTotal = false;  

  @override
  Widget build(BuildContext context) {
    String sunday = convertDateTimeToString(widget.startOfWeek.add(const Duration(days: 0)));
    String monday = convertDateTimeToString(widget.startOfWeek.add(const Duration(days: 1)));
    String tuesday = convertDateTimeToString(widget.startOfWeek.add(const Duration(days: 2)));
    String wednesday = convertDateTimeToString(widget.startOfWeek.add(const Duration(days: 3)));
    String thursday = convertDateTimeToString(widget.startOfWeek.add(const Duration(days: 4)));
    String friday = convertDateTimeToString(widget.startOfWeek.add(const Duration(days: 5)));
    String saturday = convertDateTimeToString(widget.startOfWeek.add(const Duration(days: 6)));

    var f = NumberFormat('###,###,###,###');
    final styleBackground = Theme.of(context).colorScheme.background;
    final stylePrimary = Theme.of(context).colorScheme.primary;

    return Consumer<ExpenseData>(
      builder: (context, value, child) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  TotalExpensesRow(
                    label: isTotal ? '한달 총 소비' :'주간 총 소비',
                    amount: f.format(isTotal
                        ? calculateMonthTotal(value, widget.startOfWeek)
                        : calculateWeekTotal(value, sunday, monday, tuesday, wednesday, thursday, friday, saturday)
                    ),
                  ),
                ],
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    isTotal = !isTotal;
                  });
                },
                color: stylePrimary,
                child: Text(isTotal ? '1주 총소비액' : '1달 총소비액', style: TextStyle(color: styleBackground),),
              ).pOnly(right: 25),
            ],
          ),
          SizedBox(
            height: 200,
            child: BarGraph(
              maxY: calculateMax(value, sunday, monday, tuesday, wednesday, thursday, friday, saturday),
              sunAmount: value.calculateDailyExpenseSummary()[sunday] ?? 00,
              monAmount: value.calculateDailyExpenseSummary()[monday] ?? 00,
              tueAmount: value.calculateDailyExpenseSummary()[tuesday] ?? 00,
              wedAmount: value.calculateDailyExpenseSummary()[wednesday] ?? 00,
              thurAmount: value.calculateDailyExpenseSummary()[thursday] ?? 00,
              friAmount: value.calculateDailyExpenseSummary()[friday] ?? 00,
              satAmount: value.calculateDailyExpenseSummary()[saturday] ?? 00,
            ),
          ),
        ],
      ),
    );
  }
}
