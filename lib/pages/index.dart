import 'package:flutter/material.dart';

//import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:chatapp/pages/chat/chat.dart';
import 'package:chatapp/pages/maillist/mailList.dart';
import 'package:chatapp/pages/games/games.dart';
import 'package:chatapp/pages/my/my.dart';

import 'package:chatapp/pages/sign/signIn.dart';
import 'package:chatapp/commons/waiting.dart';
//import 'package:chatapp/services/authentication.dart';



class Index extends StatefulWidget { 
  // Index({this.auth});

  //final BaseAuth auth;
  @override
   _IndexPage createState() => _IndexPage();
}

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class _IndexPage extends State<Index> {
   AuthStatus authStatus = AuthStatus.LOGGED_IN;

   String  _userId = "12345";

  @override
   void initState() {
    super.initState();
   /*
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user?.uid;
        }
        authStatus =
            user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
    });
    */
  }

  void _onLoggedIn() {
    /*widget.auth.getCurrentUser().then((user){
      setState(() {
        _userId = user.uid.toString();
      });
    });
   */
    setState(() {
      authStatus = AuthStatus.LOGGED_IN;

    });
  }

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

  
  


  Widget build(BuildContext context) {
     switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return BuildWaitingScreen();
        break;
      case AuthStatus.NOT_LOGGED_IN:
         return new SignIn( 
              // auth: widget.auth,
               onSignedIn: _onLoggedIn,
          );
        /*return new LoginSignUpPage(
          auth: widget.auth,
          onSignedIn: _onLoggedIn,
        );*/
        break;
      case AuthStatus.LOGGED_IN:
        if (_userId.length > 0 && _userId != null) {
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
          /*new HomePage(
            userId: _userId,
            auth: widget.auth,
            onSignedOut: _onSignedOut,
          );*/
        } else return BuildWaitingScreen();
        break;
      default:
        return BuildWaitingScreen();
    }
  }

   void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}