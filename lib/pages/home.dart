import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('首页'),
      ),
    );
  }
}
