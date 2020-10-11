import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:footer/footer_view.dart';
import './LoginScreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:footer/footer.dart';

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
  final spinkit = SpinKitFadingCircle(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.red : Colors.green,
        ),
      );
    },
  );

  final screenHeigh = MediaQueryData.fromWindow(window);
  final String _image =
      'https://venturebeat.com/wp-content/uploads/2019/02/google-flutter-logo-white.png?fit=400%2C200&strip=all';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: FooterView(
              children: <Widget>[
                Center(
                  child: Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(top: screenHeigh.size.height / 3),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: Image.network(
                            _image,
                            height: 120,
                          ),
                        ),
                      ),
                      Text(
                        'MY FIRST FLUTTER',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                )
              ],
              footer: new Footer(
                  backgroundColor: Colors.white,
                  child: Container(
                    child: SpinKitThreeBounce(
                      color: Color.fromRGBO(105, 175, 247, 1),
                      size: 20,
                    ),
                  )))),
    );
  }
}
