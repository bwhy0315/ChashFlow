import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

class ExpenseTile extends StatelessWidget {
  final String name;
  final String amount;
  final DateTime dateTime;
  Function(BuildContext)? deleteTapped;

  ExpenseTile({
    super.key,
    required this.name, 
    required this.amount, 
    required this.dateTime,
    required this.deleteTapped
  });

  @override
  Widget build(BuildContext context) {
    var f = NumberFormat('###,###,###,###');
    final textStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary
    );
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(), 
        children: [
          SlidableAction(
            onPressed: deleteTapped,
            icon: Icons.delete,
            backgroundColor: Colors.red,
          )
        ]
      ),
      child: ListTile(
        title: name.text.textStyle(textStyle).size(17).make().pOnly(bottom: 5),
        subtitle: '${dateTime.year} / ${dateTime.month} / ${dateTime.day}'.text.textStyle(textStyle).make(),
        trailing: '${f.format(int.parse(amount))}원'.text.textStyle(textStyle).size(15).make(),
      ).p(5),
    );
  }
}