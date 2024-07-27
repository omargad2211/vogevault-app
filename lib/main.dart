import 'package:flutter/material.dart';
import 'package:flutter_application_5/screens/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
            theme: ThemeData(
        primaryColor: Colors.yellow[700],
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ), 
      home: SplahPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}




