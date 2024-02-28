import 'package:expence_tracker/data/hive_db.dart';
import 'package:expence_tracker/datetime/date_time_helper.dart';
import 'package:flutter/material.dart';

import '../models/expense_item.dart';

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
  }

  // 날 이름  
  String getDayName(DateTime dateTime){
    switch(dateTime.weekday){
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thur';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  DateTime startOfWeekDate(){
    DateTime? startOfWeek;

    DateTime today = DateTime.now();

    for(int i=0; i < 7; i++){
      if(getDayName(today.subtract(Duration(days: i))) == 'Sun'){
        startOfWeek = today.subtract(Duration(days: i));
      }
    }

    return startOfWeek!;
  }


  Map<String, double>calculateDailyExpenseSummary() {
    Map<String, double> dailyExpenseSummary = {

    };

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
}