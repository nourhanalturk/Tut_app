import 'package:flutter/material.dart';
import 'package:tut_app/presentation/resources/routs_manager.dart';
import '../presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  //const MyApp({Key? key}) : super(key: key);  Because we need only single instance to prevent all classes from creating an instance

  //instead of this we use private named constructor
  MyApp._internal();
  static final MyApp _instance = MyApp._internal(); // single instance

  //here we force factory to return only single instance witch it _instance in line 10
  //if i have a var here and in another class i update the value of it and in another class try to print this value the same value will been printed beacuse its the same instance the another class dosent create a new instance its only one
  factory MyApp()=>_instance ;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutGenerator.getRout,
      initialRoute: Routs.splashRout,
      theme: getApplicationTheme(),

    );
  }

}
