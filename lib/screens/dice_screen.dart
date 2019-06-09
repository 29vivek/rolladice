import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:rolladice/models/dice_model.dart';
import 'package:rolladice/models/settings_model.dart';

class DiceScreen extends StatelessWidget {

  final DiceModel _diceModel = DiceModel(1, 6);

  
  @override
  Widget build(BuildContext context) {
    final SettingsModel model = ScopedModel.of<SettingsModel>(context);
    final String mode = model.isDark ? 'dark' : 'light';
  
    return ScopedModel<DiceModel>(
      model: _diceModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Roll'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },  
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
                      'images/dice-$mode-${model.diceOne}.png',
                      color: Colors.deepOrange,
                    );
                  },
                ),
              ),
              Expanded(
                child: ScopedModelDescendant(
                  builder: (BuildContext context, Widget child, DiceModel model) {
                    return Image.asset( 
                      'images/dice-$mode-${model.diceTwo}.png',
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
          onPressed: () => _diceModel.roll(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
