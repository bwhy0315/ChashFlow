import '../data/expense_data.dart';
import '../datetime/date_time_helper.dart';

double calculateMax(
    ExpenseData value,
    String sunday,
    String monday,
    String tuesday,
    String wednesday,
    String thursday,
    String friday,
    String saturday,
  ) {
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
    double? max = values.last * 1.1;

    return max == 0 ? 100 : max;
  }

  double calculateWeekTotal(
    ExpenseData value,
    String sunday,
    String monday,
    String tuesday,
    String wednesday,
    String thursday,
    String friday,
    String saturday,
  ) {
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
    for (int i = 0; i < values.length; i++) {
      total += values[i];
    }
    
    return total.floorToDouble();
  }

  double calculateMonthTotal(ExpenseData value, DateTime startOfWeek) {
    double total = 0.0;
    for (int i = 0; i < 4; i++) {
      String sunday = convertDateTimeToString(startOfWeek.add(Duration(days: i * 7)));
      total += calculateWeekTotal(
        value,
        sunday,
        convertDateTimeToString(startOfWeek.add(Duration(days: 1 + i * 7))),
        convertDateTimeToString(startOfWeek.add(Duration(days: 2 + i * 7))),
        convertDateTimeToString(startOfWeek.add(Duration(days: 3 + i * 7))),
        convertDateTimeToString(startOfWeek.add(Duration(days: 4 + i * 7))),
        convertDateTimeToString(startOfWeek.add(Duration(days: 5 + i * 7))),
        convertDateTimeToString(startOfWeek.add(Duration(days: 6 + i * 7))),
      );
    }

    return total.floorToDouble();
  }