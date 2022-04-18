// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ylitics_demo/main.dart';
import 'package:ylitics_demo/search.dart';
import 'package:ylitics_demo/settings.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  PageController _pageController = PageController(initialPage: 0);
  final _bottomNavigationBarItems = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        label: 'home'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.search,
        ),
        label: 'search'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
        ),
        label: 'settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Ylitics'))),
      body: PageView(
        onPageChanged: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        children: [
          pageView,
          Search(),
          Settings(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _bottomNavigationBarItems,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
        },
      ),
    );
  }
}

final controller = PageController(initialPage: 0);

final pageView = PageView(
  controller: controller,
  scrollDirection: Axis.vertical,
  children: [Screen1(), Screen2(), Screen3()],
);

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        children: [
          Expanded(
            child: Image(
              image: AssetImage('assets/ss1.png'),
              //fit: BoxFit.contain,
            ),
          ),
          Text('User one')
        ],
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(child: Image(image: AssetImage('assets/ss2.png'))),
          Text('User two')
        ],
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Image(
              image: AssetImage('assets/ss3.png'),
              //fit: BoxFit.cover,
            ),
          ),
          Text('User three')
        ],
      ),
    );
  }
}
