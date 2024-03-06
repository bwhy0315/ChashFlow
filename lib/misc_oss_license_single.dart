import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MiscOssLicenseSingle extends StatelessWidget {
  final String name;
  final Map<String, dynamic> json;

  String get version => json['version'];
  String get description => json['description'];
  String get licenseText => json['license'];
  //String get homepage => json['homepage'];

  const MiscOssLicenseSingle({super.key, required this.name, required this.json});

  String _bodyText() {
    return licenseText.split('\n').map((line) {
      if (line.startsWith('//')) line = line.substring(2);
      line = line.trim();
      return line;
    }).join('\n');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).canvasColor,
        child: ListView(children: <Widget>[
          if (description != null)
            description.text.make().pOnly(top: 12, left: 12, right: 12),
            const Divider(),
            Text(
              _bodyText(),
              style: Theme.of(context).textTheme.bodyMedium
            ).pOnly(top: 12, left: 12, right: 12),
          ]
        )
      ),
    );
  }
}