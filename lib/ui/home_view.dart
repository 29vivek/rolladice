import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:rolladice/service_locator.dart';
import 'package:rolladice/scoped_models/dice_model.dart';
import 'package:rolladice/scoped_models/settings_model.dart';
import 'package:rolladice/ui/settings_view.dart';


class HomeView extends StatelessWidget {

  Widget _buildDie(String asset) {
    return Expanded(child: Image.asset(asset, color: Colors.deepOrange,));
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<DiceModel>(
      model: locator<DiceModel>(),
      child: ScopedModelDescendant<DiceModel>(
        builder: (context, child, model) {
          final String mode = locator<SettingsModel>().isDark ? 'dark' : 'light';
          return Scaffold(
            appBar: AppBar(
              title: Text('Roll'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    Navigator.push(context, 
                      MaterialPageRoute(builder: (context) => SettingsView(),),
                    );
                  },
                )
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              icon: Icon(Icons.casino),
              label: Text('Roll'),
              onPressed: () => model.roll(),
              tooltip: 'Roll the dice',
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            body: Center(
              child: Row(
                children: <Widget>[
                  _buildDie('images/dice-$mode-${model.diceOne}.png'),
                  _buildDie('images/dice-$mode-${model.diceTwo}.png')
                ],
              ),
            )
          );
        },
      ),
    );
  }
}