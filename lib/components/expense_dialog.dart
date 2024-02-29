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
    return Dialog(
      child: Container(
        width: 180,
        height: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Column(
          children: [
            '음식지출'.text.size(20).make(),
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
                  color: Colors.black,
                  child: '저장'.text.white.make(),
                ),
                width5,
                MaterialButton(
                  onPressed: onCancel,
                  color: Colors.black,
                  child: '취소'.text.white.make(),
                )
              ],
            ).pOnly(top: 15),
          ],
        ).p(20),
      ),
    );
  }
}

