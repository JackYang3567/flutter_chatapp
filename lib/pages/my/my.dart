import 'package:flutter/material.dart';

class My extends StatelessWidget {
  static const String routeName = "/my";

  final data;
  My({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: .0,
        title: Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              data ?? "我的个人中心",
            ),
            FlatButton(
              child: Text("Page My "),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}