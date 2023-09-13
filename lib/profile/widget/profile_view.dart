import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        backgroundColor: const Color(0xFF1B1B1B),
        title: const Text('Profile'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Badge(
                  textColor: Colors.white,
                  label: Text('5'),
                  child: Icon(Icons.notifications))),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}
