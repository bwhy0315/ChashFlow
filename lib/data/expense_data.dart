import 'package:flutter/material.dart';
import '../datetime/date_time_helper.dart';
import '../models/expense_item.dart';
import 'hive_db.dart';

class ExpenseData extends ChangeNotifier {
  List<ExpenseItem> overallExpenseList = [];

  // 리스트 가져오기
  List<ExpenseItem> getAllExpenseList() {
    return overallExpenseList;
  }

  final db = HiveDataBase();
  void preparData() {
    if(db.readData().isNotEmpty){
      overallExpenseList = db.readData();
    }
  }

  // 추가 하기
  void addNewExpense(ExpenseItem newExpense){
    overallExpenseList.add(newExpense);
    notifyListeners();
    db.saveData(overallExpenseList);
  }

  // 지우기
  void deleteExpense(ExpenseItem expense){
    overallExpenseList.remove(expense);
    notifyListeners();
    db.saveData(overallExpenseList);
  }

  // 날 이름  
  String getDayName(DateTime dateTime){
    switch(dateTime.weekday){
      case 1:
        return '월';
      case 2:
        return '화';
      case 3:
        return '수';
      case 4:
        return '목';
      case 5:
        return '금';
      case 6:
        return '토';
      case 7:
        return '일';
      default:
        return '';
    }
  }

  DateTime startOfWeekDate(){
    DateTime? startOfWeek;
    DateTime today = DateTime.now();

    for(int i=0; i < 7; i++){
      if(getDayName(today.subtract(Duration(days: i))) == '일'){
        startOfWeek = today.subtract(Duration(days: i));
      }
    }
    return startOfWeek!;
  }

  Map<String, double>calculateDailyExpenseSummary() {
    Map<String, double> dailyExpenseSummary = { };

    for(var expense in overallExpenseList){
      String date = convertDateTimeToString(expense.dateTime);
      double amount = double.parse(expense.amount);

      if (dailyExpenseSummary.containsKey(date)){
        double currentAmount = dailyExpenseSummary[date]!;
        currentAmount += amount;
        dailyExpenseSummary[date] = currentAmount;
      } else {
        dailyExpenseSummary.addAll({date:amount});
      }
    }
    
    return dailyExpenseSummary;
  }

  double calculateMonthlyExpense() {
    double monthlyExpense = 0.0;

    for (var expense in overallExpenseList) {
      // 월별 비용 계산
      if (expense.dateTime.month == DateTime.now().month &&
          expense.dateTime.year == DateTime.now().year) {
        monthlyExpense += double.parse(expense.amount);
      }
    }

    return monthlyExpense;
  }
}