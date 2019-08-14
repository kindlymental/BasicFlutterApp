import 'package:flutter/material.dart';
import 'package:hello_world/navigator/navigator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: TabNavigator());
  }
}
