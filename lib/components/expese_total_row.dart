import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TotalExpensesRow extends StatelessWidget {
  final String label;
  final String amount;

  const TotalExpensesRow({
    super.key,
    required this.label,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        '$label: '.text.textStyle(TextStyle(color: Theme.of(context).colorScheme.primary)).bold.make(),
        '$amount원'.text.textStyle(TextStyle(color: Theme.of(context).colorScheme.primary)).make(),
      ],
    ).p(25);
  }
}