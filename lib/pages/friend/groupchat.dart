import 'package:flutter/material.dart';

class GroupChat extends StatelessWidget {
  static const String routeName = "/groupChat";

  final data;
  GroupChat({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: .0,
        title: Text("发起群聊"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              data ?? "发起群聊",
            ),
            FlatButton(
              child: Text("发起群聊 "),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}