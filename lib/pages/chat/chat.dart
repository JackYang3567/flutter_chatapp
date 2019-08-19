import 'package:flutter/material.dart';
import 'package:chatapp/pages/maillist/mailList.dart';

class Chat extends StatelessWidget {
  static const String routeName = "/chat";

  final data;
  Chat({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text("会话 "),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              data ?? " 会话页面",
            ),
            FlatButton(
              child: Text("Go to Chat"),
              onPressed: () {
                Navigator.pushNamed(context, MailList.routeName,
                    arguments: "Welcome to Chat");
              },
            ),
          ],
        ),
      ),
    );
  }
}
