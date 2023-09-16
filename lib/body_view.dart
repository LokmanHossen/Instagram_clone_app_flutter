import 'package:flutter/material.dart';
import 'package:instagram_clone_app/home_view.dart';
import 'package:instagram_clone_app/nav_bar.dart';
import 'package:instagram_clone_app/profile/profile_view.dart';
import 'package:instagram_clone_app/search/search_view.dart';

class Bodyview extends StatefulWidget {
  const Bodyview({super.key});

  @override
  State<Bodyview> createState() => _BodyviewState();
}

class _BodyviewState extends State<Bodyview> {
  int currentIndex = 0;
  var pageViewList = [
    const HomeViewScreen(),
    SearchPage(),
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
    const ProfileView(),
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
