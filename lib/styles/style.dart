import 'package:flutter/material.dart';

class AppBarStyle {
  LinearGradient get linearGradient => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(57, 129, 183, 1),
          Color.fromRGBO(37, 90, 144, 1),
        ],
      );
  List<BoxShadow> get boxShadow => const [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.25),
          offset: Offset(0, 4),
          blurRadius: 4,
          spreadRadius: 4,
        )
      ];
  List<Shadow> get textShadow => const [
        Shadow(
          color: Color.fromRGBO(50, 50, 50, 0.6),
          offset: Offset(0, -2),
        )
      ];
}
