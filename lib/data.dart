import 'package:flutter/material.dart';

Color primaryColor = const Color(0xFFCADCED);

List<BoxShadow> customShadow = [
    BoxShadow(
        color: Colors.white.withOpacity(0.5), 
        spreadRadius: -5, 
        offset: const Offset(-5, -5), 
        blurRadius: 30),
    BoxShadow(
        color: Colors.blue[900]!.withOpacity(.2),
        spreadRadius: 2,
        offset: const Offset(7, 7),
        blurRadius: 20)
  ];
  class SizeConfig {
  static getHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  static getWidth(context) {
    return MediaQuery.of(context).size.width;
  }
}
List expenses = [
  {"name": "Groceries", "amount": 500.0},
  {"name": "E-Shopping", "amount": 100.0},
  {"name": "Eating Out", "amount": 80.0},
  {"name": "Bills", "amount": 50.0},
  {"name": "Subscriptions", "amount": 100.0},
  {"name": "Fees", "amount": 30.0},
];

List pieColors = [
    Colors.indigo[400],
    Colors.blue,
    Colors.green,
    Colors.amber,
    Colors.deepOrange,
    Colors.brown,
  ];
