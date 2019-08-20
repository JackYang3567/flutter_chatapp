

import 'package:flutter/material.dart';
//import 'package:dio/dio.dart';
//import 'package:english_words/english_words.dart';

//import 'package:chatapp/pages/maillist/mailList.dart';
import 'package:chatapp/pages/friend/add.dart';
import 'package:chatapp/pages/friend/groupchat.dart';
import 'package:chatapp/pages/chat/chatList.dart';


class Chat extends StatelessWidget {
  static const String routeName = "/chat";
 
   

  final data;
  Chat({this.data});
  
  

  selectView(IconData icon, String text, String id) {
    return new PopupMenuItem<String>(
        value: id,
        child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
                new Icon(icon, color: Colors.blue),
                new Text(text),
            ],
            
        ),         
       
    );
         
 }


  @override
  Widget build(BuildContext context) {
    
     print("==dd==");
   
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: .0,
        title: Text("会话 "),
       
        actions: <Widget>[
       // 非隐藏的菜单
      /*
        new IconButton(
            icon: new Icon(Icons.add_circle_outline),
            tooltip: 'Add Alarm',
            onPressed: () async {
                final result = await showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(100.0, 80.0, 0.5, 100.0),
                  items: <PopupMenuEntry<String>>[
                      this.SelectView(IconData(0xe603,fontFamily: 'Iconfont'), '发起群聊', 'A'),
                      new PopupMenuDivider(height: 1.0),
                      this.SelectView(IconData(0xe505,fontFamily: 'Iconfont'), '添加好友', 'B'),
                      new PopupMenuDivider(height: 1.0),
                      this.SelectView(IconData(0xe7b7,fontFamily: 'Iconfont'), '扫一扫　', 'C'), 
                  ],            
                 );
            },
         
        ),
       */ 
     
        // 隐藏的菜单
        new PopupMenuButton<String>(
          
            icon: new Icon(Icons.add_circle_outline,
               color: const Color.fromRGBO(0, 0, 0, 1), 
                  
            ),
           
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                this.selectView(IconData(0xe603,fontFamily: 'Iconfont'), '发起群聊', 'A'),
                new PopupMenuDivider(height: 1.0),
                this.selectView(IconData(0xe505,fontFamily: 'Iconfont'), '添加好友', 'B'),
                 new PopupMenuDivider(height: 1.0),
                this.selectView(IconData(0xe7b7,fontFamily: 'Iconfont'), '扫一扫　', 'C'),
               
               
            ],
           
            onSelected: (String action) {
                // 点击选项的时候
                switch (action) { 
                    case 'A': 
                        //导航到新路由 :发起群聊  
                          Navigator.push( context,
                              MaterialPageRoute(builder: (context) {
                                  return GroupChat();
                              })
                          );
                        break;
                    case 'B':
                          //导航到新路由 :添加好友  
                          Navigator.push( context,
                              MaterialPageRoute(builder: (context) {
                                  return Add();
                              })
                          );                    
                         break;
                    case 'C': break;
                }
            },
        ),
    ],
      ),
      body: Center(
        /*
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
        
        */
      // child: new Text(wordPair.asPascalCase),
      child: new ChatList(),
      ),
    );
  }
}

