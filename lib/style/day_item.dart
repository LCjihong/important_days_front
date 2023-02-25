import 'package:flutter/material.dart';

const BoxDecoration containerStyle = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.12),
      offset: Offset(0, 2),
      blurRadius: 5,
    )
  ],
);

const TextStyle titleTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
);
const BoxDecoration titleBackgroundStyle = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.white, Color.fromARGB(255, 241, 241, 241)],
    // stops: [0.3, 1],
  ),
);

abstract class ItemStyle {
  late TextStyle unitTextStyle;
  late BoxDecoration unitBackgroundStyle;
  late TextStyle daysNumberStyle;
  late BoxDecoration daysNumberBackgroundStyle;
}

class AfterDayStyle implements ItemStyle {
  @override
  TextStyle unitTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    shadows: [
      Shadow(offset: Offset(0, -2), color: Color.fromRGBO(0, 0, 0, 0.2))
    ],
  );

  @override
  BoxDecoration unitBackgroundStyle =
      const BoxDecoration(color: Color.fromRGBO(65, 106, 176, 1));

  @override
  TextStyle daysNumberStyle = const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    shadows: [
      Shadow(offset: Offset(0, -2), color: Color.fromRGBO(0, 0, 0, 0.3)),
    ],
  );

  @override
  BoxDecoration daysNumberBackgroundStyle = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(144, 205, 250, 1),
        Color.fromRGBO(100, 187, 253, 1)
      ],
    ),
  );
}

class BeforeDayStyle implements ItemStyle {
  @override
  TextStyle unitTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    shadows: [
      Shadow(offset: Offset(0, -2), color: Color.fromRGBO(0, 0, 0, 0.2))
    ],
  );

  @override
  BoxDecoration unitBackgroundStyle =
      const BoxDecoration(color: Color.fromRGBO(239, 146, 54, 1));

  @override
  TextStyle daysNumberStyle = const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    shadows: [
      Shadow(offset: Offset(0, -2), color: Color.fromRGBO(0, 0, 0, 0.3)),
    ],
  );

  @override
  BoxDecoration daysNumberBackgroundStyle = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(255, 190, 69, 1),
        Color.fromRGBO(254, 159, 16, 1)
      ],
    ),
  );
}
