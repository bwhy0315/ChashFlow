import 'package:expence_tracker/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        title: "S E T T I N G".text.textStyle(
          TextStyle(
            color: Theme.of(context).colorScheme.primary
          )
        ).make(),
        
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.error,
          borderRadius: BorderRadius.circular(20)
        ),
        margin: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            "D A R K M O D E".text.textStyle(
              TextStyle(
                color: Theme.of(context).colorScheme.primary
              )
            ).make(),
            Switch(
              value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
              onChanged: (value) =>
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
            )
          ],
        ).pSymmetric(h: 25, v: 20),
      ),
    );
  }
}