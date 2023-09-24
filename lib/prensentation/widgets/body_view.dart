import 'package:flutter/material.dart';
import 'package:instagram_clone_app/prensentation/pages/home/home_view.dart';
import 'package:instagram_clone_app/prensentation/widgets/nav_bar.dart';
import 'package:instagram_clone_app/prensentation/pages/profile/profile_view.dart';
import 'package:instagram_clone_app/prensentation/pages/search/search_view.dart';
import 'package:instagram_clone_app/prensentation/pages/upload_photo/post_view.dart';

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
    const PostView(),
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
