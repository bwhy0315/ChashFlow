import 'package:expence_tracker/components/expense_summary.dart';
import 'package:expence_tracker/components/expense_tile.dart';
import 'package:expence_tracker/data/expense_data.dart';
import 'package:expence_tracker/models/expense_item.dart';
import 'package:expence_tracker/sized/container_sized.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //text controller
  final newExpenseNameController = TextEditingController();
  final newExpenseAmountController = TextEditingController();

  @override
  void initState() {
    super.initState();

    Provider.of<ExpenseData>(context, listen: false).preparData();
  }

  void addNewExpense(){
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          width: 180,height: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 2)
          ),
          child: Column(
            children: [
              '음식지출'.text.size(20).make(),
              TextField(
                controller: newExpenseNameController,
                decoration: InputDecoration(
                  hintText: '음식 이름'
                ),
              ),
              TextField(
                controller: newExpenseAmountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '(,) 제외 단위 (원)'
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    onPressed: save,
                    color: Colors.black,
                    child: '저장'.text.white.make(),
                  ),
                  width5,
                  MaterialButton(
                    onPressed: clear,
                    color: Colors.black,
                    child: '취소'.text.white.make(),
                  )
                ],
              ).pOnly(top:15)
            ],
          ).p(20),
        ),
      ),
    );
  }

  void save(){
    //지출 아이템 생성
    ExpenseItem newExpense = ExpenseItem(
      name: newExpenseNameController.text,
      amount: newExpenseAmountController.text,
      dateTime: DateTime.now()
    );
    // 지출 추가
    Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);
    clear();
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
          onPressed: addNewExpense,
          child:const  Icon(Icons.add),
        ),
        body: ListView(
          children: [
            // 지출
            ExpenseSummary(startOfWeek: value.startOfWeekDate()),

            //지출 리스트
            ListView.builder(
              shrinkWrap: true,
              itemCount: value.getAllExpenseList().length,
              itemBuilder: (context, index) => ExpenseTile(
                name: value.getAllExpenseList()[index].name,
                dateTime: value.getAllExpenseList()[index].dateTime,
                amount: value.getAllExpenseList()[index].amount,
              ),
            ).p(10),
          ],
        )
      )
    );
  }
}