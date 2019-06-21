import 'package:flutter/material.dart';
import 'package:rolladice/service_locator.dart';
import 'package:rolladice/scoped_models/settings_model.dart';


class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SwitchListTile(
        activeColor: Colors.deepOrange,
        activeTrackColor: Colors.deepOrangeAccent,
        value: locator<SettingsModel>().isDark,
        title: Text('Dark Mode'),
        subtitle: Text('Enable a dark theme for lesser eye strain.'),
        onChanged: (value) {
          locator<SettingsModel>().toggleMode();
        },
      ),
    );
  }
}