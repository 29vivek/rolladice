import 'dart:math';
import 'package:scoped_model/scoped_model.dart';

class DiceModel extends Model {
  int _diceOne;
  int _diceTwo;

  DiceModel(this._diceOne, this._diceTwo);
  

  // getters 
  int get diceOne => _diceOne;
  int get diceTwo => _diceTwo;

  void roll() {
    // generate 0-5 inclusive, add 1
    _diceOne = Random().nextInt(6) + 1;
    _diceTwo = Random().nextInt(6) + 1;
    // notify all listeners that a change has happened.
    notifyListeners();
  }
}