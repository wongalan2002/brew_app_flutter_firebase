import 'package:brew_app_flutter_firebase/shared/constants.dart';
import 'package:flutter/material.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ["0", "1", "2", "3", "4"];

  String _currentName = "";
  String _currentSugars = "akaka";
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            "Update your brew settings.",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            decoration: textInputDecoration.copyWith(hintText: "Enter Name"),
            validator: (value) => value.isEmpty ? "Please enter a name" : null,
            onChanged: (val) => setState(
              () {
                _currentName = val;
              },
            ),
          ),
          SizedBox(height: 20),

          //dropdown form field
          DropdownButtonFormField(
            // value: _currentSugars,
            decoration: textInputDecoration,
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                value: sugar,
                child: Text("$sugar Sugars"),
              );
            }).toList(),

            onChanged: (value) {
              setState(() {
                _currentSugars = value;
              });
            },
          ),

          //
          Row(
            children: [
              Expanded(
                child: Slider(
                  value: (_currentStrength ?? 100.0).toDouble(),
                  min: 100.0,
                  max: 900.0,
                  divisions: 8,
                  activeColor: Colors.brown[_currentStrength ?? 100],
                  inactiveColor: Colors.brown[100],
                  onChanged: (val) {
                    setState(() {
                      _currentStrength = val.round();
                    });
                  },
                ),
              ),
              Text(_currentStrength.toString()),
            ],
          ),
          //

          RaisedButton(
            color: Colors.pink[400],
            child: Text(
              "Update",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () async {
              print(_currentName);
              print(_currentSugars);
              print(_currentStrength);
            },
          )
        ],
      ),
    );
  }
}
