import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final bool isActive;

  Indicator({this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: new Duration(milliseconds: 200),
      height: 5.0,
      width: 40.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: isActive ? const Color(0xFF888888) : const Color(0xFFF0F0F0)),
    );
  }
}
