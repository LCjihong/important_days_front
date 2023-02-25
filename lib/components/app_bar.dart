import 'package:flutter/material.dart';
import 'package:import_days/styles/style.dart';

AppBar myAppBar() {
  final AppBarStyle appBarStyle = AppBarStyle();
  return AppBar(
    flexibleSpace: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: appBarStyle.linearGradient,
          boxShadow: appBarStyle.boxShadow),
    ),
    title: Text('Import Day',
        style: TextStyle(
          shadows: appBarStyle.textShadow,
          fontWeight: FontWeight.bold,
        )),
  );
}
