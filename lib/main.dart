import 'package:flutter/material.dart';
import 'package:rolladice/ui/home_view.dart';
import 'package:rolladice/service_locator.dart';
import 'package:rolladice/scoped_models/settings_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:rolladice/enums/view_states.dart';

void main() {
  setupLocator();
  locator<SettingsModel>().getSavedSettings();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  ThemeData _setTheme(bool isDark) {
    if(!isDark) {
      return ThemeData(
        primaryColor: Colors.deepOrange,
        brightness: Brightness.light,
        accentColor: Colors.deepOrangeAccent,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
        )
      );
    } else {
      return ThemeData(
        primaryColor: Colors.deepOrange,
        brightness: Brightness.dark,
        accentColor: Colors.deepOrangeAccent,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.black,
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<SettingsModel>(
      model: locator<SettingsModel>(),
      child: ScopedModelDescendant<SettingsModel>(
        builder: (context, child, model) {
          
          switch (model.state) {
            case ViewState.Retreived:
              return MaterialApp(
                title: 'Dice Roll',
                theme: _setTheme(model.isDark),
                home:HomeView(),
              );
              break;
            default: 
              return Center(child: CircularProgressIndicator(),);
          }
        }
      )    
    );
  }


}