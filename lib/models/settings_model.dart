import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsModel extends Model {
  bool _isDark = false;

  SettingsModel() {
   getMode(); 
  }

  void getMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDark = prefs.getBool('dark_theme') ?? false;
  }

  bool get isDark => _isDark;

  void toggleDarkMode(bool value) async {
    _isDark = value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(value)
      prefs.setBool('dark_theme', value);
    else 
      prefs.remove('dark_theme');

    notifyListeners();
  }


}