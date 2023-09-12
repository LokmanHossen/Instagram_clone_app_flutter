import 'package:flutter/material.dart';
import 'package:instagram_clone_app/nav_bar.dart';

class Bodyview extends StatefulWidget {
  const Bodyview({super.key});

  @override
  State<Bodyview> createState() => _BodyviewState();
}

class _BodyviewState extends State<Bodyview> {
  int currentIndex = 0;
  var pageViewList = [
    Container(
      color: Colors.red,
      alignment: Alignment.center,
      child: const Text('Page 1'),
    ),
    Container(
      color: Colors.yellow,
      alignment: Alignment.center,
      child: const Text('Page 2'),
    ),
    Container(
      color: Colors.amber,
      alignment: Alignment.center,
      child: const Text('Page 3'),
    ),
    Container(
      color: Colors.grey,
      alignment: Alignment.center,
      child: const Text('Page 4'),
    ),
    Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: const Text('Page 5'),
    ),
  
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(
        onDestinationSelected: (int value) {
          setState(() {
            currentIndex = value;
          });
        },
        selectionIndex: currentIndex,
      ),
      body: pageViewList[currentIndex],
    );
  }
}
