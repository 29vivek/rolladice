import 'package:flutter/material.dart';
import 'package:rolladice/screens/dice_screen.dart';
import 'package:rolladice/screens/settings_screen.dart';
import 'package:rolladice/models/settings_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:rolladice/screens/loading_screen.dart';

void main() {
  SettingsModel model = SettingsModel();
  model.loadData();
  runApp(MyApp(model));
}

class MyApp extends StatelessWidget {

  final SettingsModel _settingsModel;
  MyApp(this._settingsModel);
  
  final ThemeData _themeDataLight =ThemeData(
    primarySwatch: Colors.deepOrange,
    brightness: Brightness.light,
    accentColor: Colors.deepOrangeAccent,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    )
  );

  final ThemeData _themeDataDark =ThemeData(
    primarySwatch: Colors.deepOrange,
    brightness: Brightness.dark,
    accentColor: Colors.deepOrangeAccent,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
    )
  );

  @override
  Widget build(BuildContext context) {
    return ScopedModel<SettingsModel>(
      model: _settingsModel,
      child: ScopedModelDescendant(
        builder: (BuildContext context, Widget child, SettingsModel model) {
          if(model.isLoading) {
            return LoadingScreen();
          }  
          else {
            return MaterialApp(
              title: 'Dice Roll',
              theme: model.isDark ? _themeDataDark : _themeDataLight,
              routes: {
                '/': (context) => DiceScreen(),
                '/settings': (context) => SettingsScreen(),
              },
            );
          }
        },
          
      )
    );
  }

}