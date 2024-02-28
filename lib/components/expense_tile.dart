import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

class ExpenseTile extends StatelessWidget {
  final String name;
  final String amount;
  final DateTime dateTime;

  const ExpenseTile({
    super.key,
    required this.name, 
    required this.amount, 
    required this.dateTime
  });

  @override
  Widget build(BuildContext context) {
    var f = NumberFormat('###,###,###,###');
    return ListTile(
      title: name.text.make(),
      subtitle: '${dateTime.year} / ${dateTime.month} / ${dateTime.day}'.text.make(),
      trailing: '${f.format(int.parse(amount))}원'.text.make(),
    );
  }
}