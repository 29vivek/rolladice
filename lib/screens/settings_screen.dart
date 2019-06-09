import 'package:flutter/material.dart';
import 'package:rolladice/models/settings_model.dart';
import 'package:scoped_model/scoped_model.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SettingsModel model = ScopedModel.of<SettingsModel>(context);

    bool _isChecked =  model.isDark;
    // initial state of the switch
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SwitchListTile(
        activeColor: Colors.deepOrangeAccent,
        activeTrackColor: Colors.deepOrange,
        value: _isChecked,
        title: Text('Dark Mode'),
        subtitle: Text('Enable a dark theme for lesser eye strain.'),
        onChanged: (value) {
          // switch on/off - value is the bool value of the switch's current state
          model.toggleDarkMode(value);
        },
      ),
    );
  }

}

