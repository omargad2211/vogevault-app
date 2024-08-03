// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter_application_5/models/user.dart';
import 'package:flutter_application_5/screens/splash.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_application_5/screens/login.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive and Flutter Hive
  await Hive.initFlutter();

  // Register the User adapter
  Hive.registerAdapter(UserAdapter());

  // Open the 'users' box
  await Hive.openBox<User>('users');

  runApp( MyApp());
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




