import 'package:get_it/get_it.dart';
import 'package:rolladice/scoped_models/dice_model.dart';
import 'package:rolladice/services/diceroll_service.dart';
import 'package:rolladice/scoped_models/settings_model.dart';
import 'package:rolladice/services/darkmode_service.dart';

// ambient variable
GetIt locator = GetIt();

void setupLocator() {
  // services and models
  locator.registerLazySingleton<DarkmodeService>(() => DarkmodeService());
  locator.registerSingleton<SettingsModel>(SettingsModel());

  locator.registerLazySingleton<DicerollService>(() => DicerollService());
  locator.registerFactory<DiceModel>(() => DiceModel());
  
}