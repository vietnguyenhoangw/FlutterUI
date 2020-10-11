import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() {
    return new LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final String _image =
      'https://venturebeat.com/wp-content/uploads/2019/02/google-flutter-logo-white.png?fit=400%2C200&strip=all';

  @override
  Widget build(BuildContext context) {
    double appBarHeight = AppBar().preferredSize.height;
    final screenHeigh = MediaQueryData.fromWindow(window);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('LoginScreen'),
        leading: Container(
            child: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () => Navigator.pop(context),
          color: Colors.white,
        )),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(
            height: screenHeigh.size.height - (appBarHeight + 25),
          ),
          child: Container(
            padding: EdgeInsets.all(40.0),
            color: Colors.transparent,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(height: 100.0, child: Image.network(_image)),
                  Container(
                    child: Text('Welcome to MFF',
                        style: TextStyle(fontSize: 30.0)),
                  ),
                  Container(
                    child: Text('Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30.0)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 60.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '',
                        labelText: 'Username',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: TextField(
                      decoration:
                          InputDecoration(hintText: '', labelText: 'Password'),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 40.0),
                      child: GestureDetector(
                        onTap: () {
                          Alert(
                            context: context,
                            title: "Messages",
                            desc: "Login button clicked",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "OK",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                onPressed: () => Navigator.pop(context),
                                width: 120,
                              )
                            ],
                          ).show();
                        },
                        child: Container(
                          height: 50.0,
                          color: Color.fromRGBO(105, 175, 247, 1),
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ),
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          Alert(
                            context: context,
                            title: "Messages",
                            desc: "ForgotPassword button clicked",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "OK",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                onPressed: () => Navigator.pop(context),
                                width: 120,
                              )
                            ],
                          ).show();
                        },
                        child: Container(
                          height: 15.0,
                          child: Center(
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15.0),
                            ),
                          ),
                        ),
                      ))
                ]),
          ),
        ),
      ),
    );
  }
}
