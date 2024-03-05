import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../sized/container_sized.dart';

class ExpenseDialog extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController amountController;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const ExpenseDialog({
    required this.nameController,
    required this.amountController,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    var styleBackground = Theme.of(context).colorScheme.background;
    var stylePrimary = Theme.of(context).colorScheme.primary;

    return Dialog(
      child: Container(
        width: 200,
        height: 250,
        decoration: BoxDecoration(
          color: styleBackground,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: stylePrimary, width: 2),
        ),
        child: Column(
          children: [
            '음식지출'.text.textStyle(TextStyle(color: stylePrimary)).size(20).make(),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: '음식 이름',
              ),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: '(,) 제외 단위 (원)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: onSave,
                  color: stylePrimary,
                  child: '저장'.text.textStyle(TextStyle(color: styleBackground)).make(),
                ),
                width5,
                MaterialButton(
                  onPressed: onCancel,
                  color: stylePrimary,
                  child: '취소'.text.textStyle(TextStyle(color: styleBackground)).make(),
                )
              ],
            ).pOnly(top: 15),
          ],
        ).p(20),
      ),
    );
  }
}