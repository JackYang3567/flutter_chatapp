import 'package:flutter/material.dart';

class Games extends StatelessWidget {
  static const String routeName = "/games";

  final data;
  Games({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text("游戏"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              data ?? "游戏页面",
            ),
            FlatButton(
              child: Text("games "),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}