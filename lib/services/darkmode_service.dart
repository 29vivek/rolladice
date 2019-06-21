import 'package:shared_preferences/shared_preferences.dart';

class DarkmodeService {

  Future<bool> getMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('done');
    return prefs.getBool('dark_theme') ?? false;
  }

  Future<void> setMode(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('dark_theme', isDark);
  }

}