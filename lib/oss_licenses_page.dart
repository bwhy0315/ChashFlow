import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'misc_oss_license_single.dart';
import 'oss_licenses.dart';

class OssLicensesPage extends StatelessWidget {

  static Future<List<String>> loadLicenses() async {
    final ossKeys = ossLicenses.keys.toList();
    return ossKeys..sort();
  }

  static final _licenses = loadLicenses();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:'Open Source Licenses'.text.make(),
        ),
        body: FutureBuilder<List<String>>(
            future: _licenses,
            builder: (context, snapshot) {
              return ListView.separated(
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    final key = snapshot.data![index];
                    final licenseJson = ossLicenses[key];
                    final version = licenseJson['version'];
                    final desc = licenseJson['description'];
                    return ListTile(
                        title: '$key ${version ?? ''}'.text.make(),
                        subtitle: desc != null ? Text(desc) : null,
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MiscOssLicenseSingle(name: key, json: licenseJson)))
                    );
                  },
                  separatorBuilder: (context, index) => const Divider()
              ).p(0);
            }
        )
    );
  }
}