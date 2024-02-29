import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TotalExpensesRow extends StatelessWidget {
  final String label;
  final String amount;

  const TotalExpensesRow({
    Key? key,
    required this.label,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        '$label: '.text.bold.make(),
        '$amount원'.text.make(),
      ],
    ).p(25);
  }
}