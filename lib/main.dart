import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'MY FIRST FLUTTER'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final String _image =
      'https://venturebeat.com/wp-content/uploads/2019/02/google-flutter-logo-white.png?fit=400%2C200&strip=all';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    double appBarHeight = AppBar().preferredSize.height;
    final screenHeigh = MediaQueryData.fromWindow(window);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
        leading: Container(
            child: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () => {print('Click on back press!')},
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
                          print('Login was tapped!');
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
                          print('ForgotPassword? was tapped!');
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
