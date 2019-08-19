import 'package:flutter/material.dart';

//import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:chatapp/pages/chat/chat.dart';
import 'package:chatapp/pages/maillist/mailList.dart';
import 'package:chatapp/pages/games/games.dart';
import 'package:chatapp/pages/my/my.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*
      routes: <String, WidgetBuilder>{
        MyHomePage.routeName: (context) => MyHomePage(),
        // Page1.routeName: (context) => Page1()
      },
      initialRoute: MyHomePage.routeName,
      onGenerateRoute: (RouteSettings settings) {
        var page;
        String routeName = settings.name;
        switch (routeName) {
          case Page1.routeName:
            page = Page1(
              data: settings.arguments,
            );
            return MaterialPageRoute(builder: (context) => page);
            break;

          case Page2.routeName:
            page = Page2(
              data: settings.arguments,
            );
            return MaterialPageRoute(builder: (context) => page);
            break;

            case Page4.routeName:
            page = Page4(
              data: settings.arguments,
            );
            return MaterialPageRoute(builder: (context) => page);
            break;
        }
      },
      onUnknownRoute: (RouteSettings settings) {
        var page;
        page = Page3(data: settings.arguments);

        return MaterialPageRoute(builder: (context) => page);
      },
      */
      title: 'Bottom Navigation',
      home: MyHomePage(),
      theme: ThemeData(primaryColor: Colors.orange),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const String routeName = "/";
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;
  int _counter = 0;
  final List<Widget> _children = [Chat(), MailList(), Games(), My()];

  final List<BottomNavigationBarItem> _list = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('会话'),
        //backgroundColor: Colors.orange
        ),
    BottomNavigationBarItem(
        icon: Icon(Icons.book),
        title: Text('通讯录'),
        //backgroundColor: Colors.orange
        ),
    BottomNavigationBarItem(
        icon: Icon(Icons.music_video),
        title: Text('游戏'),
        //backgroundColor: Colors.orange
        ),
    BottomNavigationBarItem(
        icon: Icon(Icons.movie),
        title: Text('我'),
        //backgroundColor: Colors.orange
        ),
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(
     //   title: Text(widget.title ?? "相遇"),
     // ),
     /*Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text("Go to Page 1"),
              onPressed: () {
                Navigator.pushNamed(context, Page1.routeName,
                    arguments: "This is some data");
              },
            ),
          ],
        ),
      ),
      */
       bottomNavigationBar: BottomNavigationBar( // 底部导航
        items:  _list,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        fixedColor: Colors.green,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
       body:  IndexedStack(
        index: _selectedIndex,
        children: _children,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

   void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}