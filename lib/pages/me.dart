import 'package:flutter/material.dart';

class Me extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MeState();
}

class _MeState extends State<Me> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Text('我的'),
      )
    );
  }
}