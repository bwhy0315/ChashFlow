import 'package:expence_tracker/theme/theme_provider.dart';
import 'package:flutter/cupertino.dart';
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
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Row(
        children: [
          "D A R K M O D E".text.textStyle(TextStyle(color: Theme.of(context).colorScheme.primary)).make(),
          CupertinoSwitch(
            value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode, 
            onChanged: (value) =>
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme()
          )
        ],
      ),
    );
  }
}