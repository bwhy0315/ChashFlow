import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import '../components/expense_dialog.dart';
import '../components/expense_summary.dart';
import '../components/expense_tile.dart';
import '../data/expense_data.dart';
import '../models/expense_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final newExpenseNameController = TextEditingController();
  final newExpenseAmountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<ExpenseData>(context, listen: false).preparData();
  }

  void addNewExpense() {
    showDialog(
      context: context,
      builder: (context) => ExpenseDialog(
        nameController: newExpenseNameController,
        amountController: newExpenseAmountController,
        onSave: save,
        onCancel: clear,
      ),
    );
  }

  void save(){
    //지출 아이템 생성
    if(newExpenseAmountController.text.isNotEmpty && newExpenseNameController.text.isNotEmpty){
      ExpenseItem newExpense = ExpenseItem(
        name: newExpenseNameController.text,
        amount: newExpenseAmountController.text,
        dateTime: DateTime.now()
      );
      // 지출 추가
      Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);
      clear();
    }
  }

  void deleteExpense(ExpenseItem expense) {
    Provider.of<ExpenseData>(context, listen: false).deleteExpense(expense);
  }

  void clear(){
    newExpenseNameController.clear();
    newExpenseAmountController.clear();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey[300],
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: Colors.black,
          onPressed: addNewExpense,
          child:const  Icon(Icons.add,color: Colors.white,),
        ),
        body: ListView(
          children: [
            // 지출
            ExpenseSummary(startOfWeek: value.startOfWeekDate()),
            //지출 리스트
            ListView.builder(
              shrinkWrap: true,
              itemCount: value.getAllExpenseList().length,
              itemBuilder: (context, index) => 
                ExpenseTile(
                  name: value.getAllExpenseList()[index].name,
                  dateTime: value.getAllExpenseList()[index].dateTime,
                  amount: value.getAllExpenseList()[index].amount,
                  deleteTapped: (p0) => 
                      deleteExpense(value.getAllExpenseList()[index]),
                ),
            ).p(10),
          ],
        )
      )
    );
  }
}