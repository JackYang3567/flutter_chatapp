import 'package:flutter/material.dart';

//import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:chatapp/pages/chat/chat.dart';
import 'package:chatapp/pages/maillist/mailList.dart';
import 'package:chatapp/pages/games/games.dart';
import 'package:chatapp/pages/my/my.dart';

import 'package:chatapp/pages/sign/signIn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '相遇',
      home: SignIn(),//HomePage(),
      theme: ThemeData(primaryColor: Colors.orange),
    );
  }
}

class HomePage extends StatefulWidget { 
  @override
   _HomePage createState() => _HomePage();
   
}


class _HomePage extends State<HomePage> {
  int _selectedIndex = 1;
 
  final List<Widget> _children = [Chat(), MailList(), Games(), My()];

  final List<BottomNavigationBarItem> _list = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(IconData(0xe603, fontFamily: 'Iconfont')),
        title: Text('会话'),
        //backgroundColor: Colors.orange
        ),
    BottomNavigationBarItem(
        icon: Icon( IconData( 0xe620, fontFamily: 'Iconfont')),
        title: Text('通讯录'),
        //backgroundColor: Colors.orange
        ),
    BottomNavigationBarItem(
        icon: Icon(IconData( 0xe70a, fontFamily: 'Iconfont')),
        title: Text('游戏'),
        //backgroundColor: Colors.orange
        ),
    BottomNavigationBarItem(
        icon: Icon(IconData(0xe61c,fontFamily: 'Iconfont')),
        title: Text('我'),
        //backgroundColor: Colors.orange
        ),
  ];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
       bottomNavigationBar: BottomNavigationBar( // 底部导航
        items:  _list,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        fixedColor: Colors.green,
        onTap: _onItemTapped,
      ),
    
       body: IndexedStack(
        index: _selectedIndex,
        children: _children,
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

   void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}