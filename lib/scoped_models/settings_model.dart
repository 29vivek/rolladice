import 'package:scoped_model/scoped_model.dart';
import 'package:rolladice/service_locator.dart';
import 'package:rolladice/services/darkmode_service.dart';
import 'package:rolladice/enums/view_states.dart';

class SettingsModel extends Model {

  bool isDark;
  ViewState _state;
  ViewState get state => _state;

  DarkmodeService darkmodeService = locator<DarkmodeService>();

  void getSavedSettings() async {
    _setState(ViewState.Busy);
    // await Future.delayed(Duration(seconds: 5));
    isDark = await darkmodeService.getMode();
    _setState(ViewState.Retreived);
  }

  void _setState(ViewState newState) {
    _state = newState;
    notifyListeners();
  }

  void toggleMode() async {
    if(isDark) {
      darkmodeService.setMode(false);
      isDark = false;
    } else {
      darkmodeService.setMode(true);
      isDark = true;
    }
    notifyListeners();
  }
  

}