import 'package:flutter/material.dart';
import 'package:chatapp/pages/maillist/mailList.dart';
import 'package:chatapp/pages/friend/add.dart';
import 'package:chatapp/pages/friend/groupchat.dart';

class Chat extends StatelessWidget {
  static const String routeName = "/chat";
 

  final data;
  Chat({this.data});
  
  SelectView(IconData icon, String text, String id) {
    return new PopupMenuItem<String>(
        value: id,
        child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
                new Icon(icon, color: Colors.blue),
                new Text(text),
            ],
        )
    );
 }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: .0,
        title: Text("会话 "),
        
        actions: <Widget>[
       /* // 非隐藏的菜单
        new IconButton(
            icon: new Icon(Icons.add_alarm),
            tooltip: 'Add Alarm',
            onPressed: () {}
        ),
        */
        // 隐藏的菜单
        new PopupMenuButton<String>(
            icon: new Icon(Icons.add_circle_outline,
               color: const Color.fromRGBO(0, 0, 0, 1),
            ),

            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                this.SelectView(Icons.message, '发起群聊', 'A'),
                this.SelectView(Icons.group_add, '添加好友', 'B'),
                this.SelectView(Icons.cast_connected, '扫一扫', 'C'),
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
