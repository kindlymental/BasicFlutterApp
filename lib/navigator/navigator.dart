import 'package:flutter/material.dart';
import 'package:hello_world/pages/home.dart';
import 'package:hello_world/pages/me.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final PageController _controller = PageController(initialPage: 0);
  int _currentIndex = 0;

  final _defaultColor = Colors.grey;
  final _selectedColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[Home(), Me()],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: _defaultColor),
                activeIcon: Icon(Icons.home, color: _selectedColor),
                title: Text('首页', style: TextStyle(color: _currentIndex==0?_selectedColor:_defaultColor),)),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle, color: _defaultColor),
                activeIcon: Icon(Icons.account_circle, color: _selectedColor),
                title: Text('我的', style: TextStyle(color: _currentIndex==1?_selectedColor:_defaultColor),))
          ]),
    );
  }
}
