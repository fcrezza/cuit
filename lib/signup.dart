import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
      //  logo,
        Text("Daftar", style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black, fontSize: 26.0), )
      ],)
    );
  }
}
