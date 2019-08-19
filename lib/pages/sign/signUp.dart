import 'package:flutter/material.dart';



class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to SignUp',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to SignUp'),
        ),
        body: new Center(
          child: new Text('==SignUp=='),
        ),
      ),
    );
  }
}