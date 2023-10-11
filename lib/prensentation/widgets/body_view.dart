import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_app/prensentation/pages/home/home_view.dart';
import 'package:instagram_clone_app/prensentation/widgets/nav_bar.dart';
import 'package:instagram_clone_app/prensentation/pages/profile/profile_view.dart';
import 'package:instagram_clone_app/prensentation/pages/search/search_view.dart';
import 'package:instagram_clone_app/prensentation/pages/upload_photo/post_view.dart';

class BodyView extends StatefulWidget {
  const BodyView({super.key});

  @override
  State<BodyView> createState() => _BodyViewState();
}

class _BodyViewState extends State<BodyView> {
  int currentIndex = 0;
  var pageViewList = [
    HomeView(),
    SearchPage(),
    const PostView(),
    const Text("Hello"),

    const ProfileView(userId: ''),

    // ProfileView(userId: FirebaseAuth.instance.currentUser!.uid ),
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
