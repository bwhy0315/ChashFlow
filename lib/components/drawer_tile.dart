import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final Widget leading;
  final VoidCallback? onTap;

  const DrawerTile({
    super.key, 
    required this.title, 
    required this.leading, 
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title.text.bold.textStyle(TextStyle(color: Theme.of(context).colorScheme.primary)).make(),
      leading: leading,
      onTap: onTap,
    ).pOnly(left: 20);
  }
}