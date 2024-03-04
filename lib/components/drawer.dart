import 'package:expence_tracker/screen/s_setting.dart';
import 'package:flutter/material.dart';

import '../oss_licenses_page.dart';
import 'drawer_tile.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
            child: Icon(Icons.money)
          ),
          DrawerTile(
            title: "H O M E",
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          DrawerTile(
            title: "S E T T I N G",
            leading: Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const SettingScreen()
                )
              );
            },
          ),
          DrawerTile(
            title: "O P E N - S O U R C E       - L I C E N S E S",
            leading: Icon(Icons.book),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => OssLicensesPage()
                )
              );
            },
          ),
        ],
      )
    );
  }
}