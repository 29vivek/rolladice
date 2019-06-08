import 'package:flutter/material.dart';
import 'dart:math';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }

}

class MyAppState extends State<MyApp> {

  int _diceOne = 1;
  int _diceTwo = 2;
  bool _isDark = true;

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
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roll',
      theme: _isDark ? _themeDataDark : _themeDataLight,
      home: Scaffold(
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
                child: Image.asset(
                  'images/dice-${_isDark?'dark':'light'}-$_diceOne.png',
                  color: Colors.deepOrange,
                ),
              ),
              Expanded(
                child: Image.asset(
                  'images/dice-${_isDark?'dark':'light'}-$_diceTwo.png',
                  color: Colors.deepOrange,
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
            setState(() {
              _diceOne = Random().nextInt(6) + 1;
              _diceTwo = Random().nextInt(6) + 1;
            });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      )
    );
  }

}