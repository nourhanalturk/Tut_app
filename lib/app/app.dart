import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  //const MyApp({Key? key}) : super(key: key);  Because we need only single instance to prevent all classes from creating an instance

  //instead of this we use private named constructor
  MyApp._internal();
  static final MyApp _instance = MyApp._internal(); // single instance

  // by using factory we can determine witch instance we need and return the single instance
  //if i have a var here and in another class i update the value of it and in another class try to print this value the same value will been printed beacuse its the same instance the another class dosent create a new instance its only one
  factory MyApp()=>_instance ;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
