import 'package:scoped_model/scoped_model.dart';
import 'package:rolladice/service_locator.dart';
import 'package:rolladice/services/diceroll_service.dart';

class DiceModel extends Model {
  int diceOne = 1;
  int diceTwo = 2;

  DicerollService dicerollService = locator<DicerollService>();

  void roll() {
    diceOne = dicerollService.roll();
    diceTwo = dicerollService.roll();
    notifyListeners();
  }

}