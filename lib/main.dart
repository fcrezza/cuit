import 'package:flutter/material.dart';

import 'file:///C:/Users/User/Desktop/cuit/lib/features/onboarding/onboarding.dart';
import 'package:cuit/features/signup.dart';
import 'package:cuit/features/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cuit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0))),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 12.0)),
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xFF333333)),
              foregroundColor: MaterialStateProperty.all(Colors.white)),
        ),
        textTheme: const TextTheme(
            headline1: TextStyle(color: const Color(0xFF333333)),
            bodyText1: TextStyle(color: Colors.black54)),
      ),
      routes: {
        '/': (BuildContext context) => Onboarding(),
        '/signup': (BuildContext context) => Signup(),
        '/login': (BuildContext context) => Login()
      },
    );
  }
}
