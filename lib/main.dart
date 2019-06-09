import 'package:flutter/material.dart';
import 'dart:math';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class DiceModel extends Model {
  int _diceOne = 1;
  int _diceTwo = 2;

  void roll() {
    _diceOne = Random().nextInt(6) + 1;
    _diceTwo = Random().nextInt(6) + 1;
    notifyListeners();
  }

  int get diceOne => _diceOne;
  int get diceTwo => _diceTwo;
}

class MyApp extends StatelessWidget {

  // bool _isDark = true;

  ThemeData _themeDataLight =ThemeData(
    primarySwatch: Colors.deepOrange,
    brightness: Brightness.light,
    accentColor: Colors.deepOrangeAccent,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    )
  );

  ThemeData _themeDataDark =ThemeData(
    primarySwatch: Colors.deepOrange,
    brightness: Brightness.dark,
    accentColor: Colors.deepOrangeAccent,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
    )
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roll',
      theme: _themeDataLight,
      home: DiceScreen(),
    );
  }

}

class DiceScreen extends StatelessWidget {
  final DiceModel diceModel = DiceModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<DiceModel>(
      model: DiceModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Roll'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
        body: Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ScopedModelDescendant(
                  builder: (BuildContext context, Widget child, DiceModel model) {
                    return Image.asset(
                      'images/dice-${'light'}-${model.diceOne}.png',
                      color: Colors.deepOrange,
                    ); 
                  },
                ), 
              ),
              Expanded(
                child: ScopedModelDescendant(
                  builder: (BuildContext context, Widget child, DiceModel model) {
                    return Image.asset(
                      'images/dice-${'light'}-${model.diceTwo}.png',
                      color: Colors.deepOrange,
                    ); 
                  },
                ), 
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.casino),
          label: Text('Roll'),
          tooltip: 'Roll the dice',
          onPressed: () {
            diceModel.roll();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

}