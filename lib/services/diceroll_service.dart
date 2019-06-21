import 'dart:math';

class DicerollService {
  int roll() {
    return Random().nextInt(6) + 1;
  }
}