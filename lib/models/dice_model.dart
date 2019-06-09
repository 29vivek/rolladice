import 'dart:math';
import 'package:scoped_model/scoped_model.dart';

class DiceModel extends Model {
  int _diceOne;
  int _diceTwo;

  DiceModel(this._diceOne, this._diceTwo);
  
  int get diceOne => _diceOne;
  int get diceTwo => _diceTwo;

  void roll() {
    _diceOne = Random().nextInt(6) + 1;
    _diceTwo = Random().nextInt(6) + 1;
    notifyListeners();
  }
}