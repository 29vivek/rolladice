import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsModel extends Model {
  bool _isDark = false;
  bool _isLoading = true;

  void loadData() async {
    // Model is still loading data
    _isLoading = true;
    // show a spinner saying still loading data now.
    notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDark =prefs.getBool('dark_theme') ?? false;

    // loading done, monitor isLoading variable in the listener to load app now.
    _isLoading = false;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  bool get isDark => _isDark;

  void toggleDarkMode(bool value) async {
    _isDark = value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('dark_theme', value);
    notifyListeners();
  }


}