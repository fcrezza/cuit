import 'package:flutter/material.dart';

import 'package:cuit/onboarding.dart';

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
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12.0)),
                  backgroundColor: MaterialStateProperty.all(const Color(0xFF333333)),
                  foregroundColor: MaterialStateProperty.all(Colors.white)),
              ),
        textTheme: const TextTheme(
            headline1: TextStyle(color: Color(0xFF333333)),
            bodyText1: TextStyle(color: Colors.black54)
        ),
      ),

      home: Onboarding(),
    );
  }
}


