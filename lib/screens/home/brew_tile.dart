import 'package:brew_crew/models/brew.dart';
import 'package:flutter/material.dart';

class BrewTile extends StatelessWidget {
  final Brew? brew;

  const BrewTile({Key? key, this.brew}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 8,
      ),
      child: Card(
        margin: EdgeInsets.fromLTRB(
          20.0,
          6.0,
          20.0,
          0.0,
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("assets/coffee_icon.png"),
            radius: 25,
            backgroundColor: Colors.brown[brew!.strength!],
          ),
          title: Text(brew!.name!),
          subtitle: Text("Takes ${brew!.sugars} sugar's"),
        ),
      ),
    );
  }
}
