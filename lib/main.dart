import 'package:flutter/material.dart';
//mport 'package:shared_preferences/shared_preferences.dart';
//import 'package:chatapp/services/authentication.dart';
import 'package:chatapp/pages/index.dart';

void main() => runApp(MyApp());
final String appTitle = '相遇';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.orange),
      home: new Index()
    );    
  }
}
