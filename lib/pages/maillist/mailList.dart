import 'package:flutter/material.dart';

//import 'package:chatapp/main.dart';

class MailList extends StatelessWidget {
  static const String routeName = "/mailList";

  final data;
  MailList({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text("通讯录"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              data ?? "通讯录页面",
            ),
            FlatButton(
              child: Text("MailList "),
              onPressed: () {
               // Navigator.pushNamed(context, HomePage.routeName,
               //     arguments: "This is some data");
              },
            ),
          ],
        ),
      ),
    );
  }
}