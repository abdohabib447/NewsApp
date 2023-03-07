import 'package:flutter/material.dart';

class MyThemeData {
  static Color primaryColor = const Color(0xff39A552);
  static var ligthTheme = ThemeData(
      appBarTheme: AppBarTheme(
          backgroundColor: primaryColor,
          //toolbarHeight: MediaQuery.of(context).size.height*,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          centerTitle: true,
          titleTextStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.normal,
              color: Colors.white)),
      textTheme:  const TextTheme(
        titleLarge:  TextStyle(
            fontSize: 24, fontWeight: FontWeight.normal, color: Colors.white),
        headlineMedium:  TextStyle(
            fontSize: 22, fontWeight: FontWeight.normal, color: Colors.white),
        bodyMedium:  TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        displayMedium:  TextStyle(
            fontSize: 14, fontWeight: FontWeight.normal,
        )
      ));
}
