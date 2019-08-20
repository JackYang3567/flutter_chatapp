import 'package:flutter/material.dart';

//import 'package:chatapp/services/authentication.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/rendering.dart';

import 'package:chatapp/pages/sign/signUp.dart';
//import 'package:chatapp/services/authentication.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(new SignIn());
}

class SignIn extends StatelessWidget {
  // This widget is the root of your application.
   SignIn({//this.auth, 
   this.onSignedIn});

 // final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
         theme: new ThemeData(
           primaryColor: Colors.grey[200],
        ),
        title: '登录',
        home: Scaffold(
          appBar: AppBar(
            title: Text('登录' ),
          ),
          body: new LoginHomePage(),
        ));
  }
}

class LoginHomePage extends StatefulWidget {
  @override
  _LoginHomePageState createState()=> _LoginHomePageState();
   
}

class _LoginHomePageState extends State<LoginHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _userNameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  bool _showLoading = false;
  bool pwdShow = false; //密码是否显示明文
  bool clearText = false; //清除文本
  bool _nameAutoFocus = true;

  Future _loginRequest() async {
    return Future.delayed(Duration(seconds: 3), () {
      //do nothing
      print('登录成功');
    });
  }

  void _toggleSubmit() {
  
    if (_formKey.currentState.validate()) {
      setState(() {
        _showLoading = true;
      });
     
      _loginRequest().then((onValue) {
        setState(() {
          _showLoading = false;
        });
       
        showDialog(
            context: context,
            builder: (context) {
              String alertText = 'login success!' +
                  ' \nuserName:' +
                  _userNameTextController.text +
                  '\npassWord:' +
                  _passwordTextController.text;
              return AlertDialog(
                content: Text(alertText),
              );
            });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> childrens = [];
    final _mainConatiner = Container(
      padding: EdgeInsets.fromLTRB(10.0,60.0, 10.0, 0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
               Image.asset(
                  'assets/images/app.png',
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.fitHeight,
                ),
           
            Padding(
              padding: EdgeInsets.only(top:60.0),
            ),

            Row(
                mainAxisSize: MainAxisSize.min,
                children: [                 
                  Padding(
                   padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  ),
               
                  new Text(
                      '帐号',
                    style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    height: 1.2,  
                    fontFamily: "Courier",
                  ),
                    
                  ),
                   Padding(
                   padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                  ),
                  new Expanded(
                      child: new TextFormField(
                     // autofocus: _nameAutoFocus,
                      controller: _userNameTextController,
                      decoration: InputDecoration(
                      hintText: '手机号/相遇号(6-16位字母/数字)',
                      suffixIcon: IconButton(                         
                          icon: Icon(                           
                             Icons.clear ,
                            ),
                          onPressed: () {                                                   
                            setState(() {
                              clearText = !clearText;
                            }); 
                            _userNameTextController.text = '';                           
                          },                         
                        ),
                      ),
                     
                      validator: (String value) {
                        if (value.trim().isEmpty) {
                          return '请输入帐号';
                        }
                        return "";
                      },
                      
                    ),

                    
                  ),
                  
                ],
              ),

           
            Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),

            Row(
                children: [
                   Padding(
                   padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  ),
                  new Text('密码',
                   style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    height: 1.2,  
                    fontFamily: "Courier",
                   // background: new Paint()..color=Colors.yellow,
                   // decoration:TextDecoration.underline,
                    //decorationStyle: TextDecorationStyle.dashed
                  ),
                  ),

                    Padding(
                     padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                    ),
                  new Expanded(
                    child: new TextFormField(
                       controller: _passwordTextController,
                       autofocus: !_nameAutoFocus,
                       decoration: InputDecoration(
                       // labelText: '请输入密码(6-16位)',
                        hintText: '请输入密码(6-16位)',
                       // prefixIcon: Icon(Icons.lock),
                       
                        suffixIcon: IconButton(
                          
                          icon: Icon(
                              pwdShow ? Icons.visibility_off : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              pwdShow = !pwdShow;
                            });
                          },
                        ),
                        ),

                      obscureText: !pwdShow,
                      validator:  ( String value) {
                        if (value.trim().isEmpty) {
                          return '请输入密码(6-16位)';
                        }
                         return "";
                      },
                     
                      
                    ),
                  ),
                ],
              ),

           
            Padding(
              padding: EdgeInsets.only(top: 30.0),
            ),
           
         
               Row(
                children: [ 
                  Padding(
                    padding: EdgeInsets.only(left: 280.0),
                  ),
                  FlatButton(
                    child: Text(
                        "快速注册 >>",
                        textAlign: TextAlign.left,
                        style: TextStyle( fontSize: 14.0,color: Colors.red,)
                    ),
                    onPressed: () {
                       //导航到新路由   
                      Navigator.push( context,
                          MaterialPageRoute (builder:  ( context) {
                             return SignUp();
                          }) 
                      );
                    },
                    ),
                ]
               ),
            Padding(
              padding: EdgeInsets.only(top: 30.0),
            ),
            SizedBox(
              width: double.infinity,
              height: 50.0,
              
              child: RaisedButton(
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                onPressed: _toggleSubmit,                
                child: Text(
                  '登录',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                color: Colors.blue,
             
              ),
            )
          ],
        ),
      ),
    );
    final _loadingContainer = Container(
        constraints: BoxConstraints.expand(),
        color: Colors.black12,
        child: Center(
          child: Opacity(
            opacity: 0.9,
            child: SpinKitWave(
              color: Colors.red,
              size: 50.0,
            ),
          ),
        ));
    childrens.add(_mainConatiner);

    if (_showLoading) {
      childrens.add(_loadingContainer);
    }
    return Stack(
      children: childrens,
    );
  }
}

