import 'package:flutter/material.dart';
import 'package:chatapp/pages/chat/chat.dart';

class Add extends StatelessWidget {
  static const String routeName = "/addfriend";

  final data;
  Add({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
       
        elevation: .0,
        title: Text("添加好友"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              data ?? "添加好友",
            ),
            FlatButton(
              child: Text("添加好友 "),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}