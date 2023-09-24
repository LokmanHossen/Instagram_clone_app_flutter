import 'package:flutter/material.dart';
import 'package:instagram_clone_app/prensentation/pages/profile/widget/profile_header_card.dart';
import 'package:instagram_clone_app/prensentation/pages/profile/widget/profile_post_card.dart';
import 'package:instagram_clone_app/prensentation/pages/profile/widget/profile_reels_card.dart';
import 'package:instagram_clone_app/prensentation/pages/profile/widget/profile_save_card.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
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
        body: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [
                const ProfileHeaderCard(),
              ];
            },
            body: Column(
              children: [
                const TabBar(tabs: [
                  Tab(icon: Icon(Icons.add_a_photo)),
                  Tab(icon: Icon(Icons.play_circle_outline)),
                  Tab(icon: Icon(Icons.bookmark_outline)),
                ]),
                Expanded(
                  child: TabBarView(children: [
                    ProfilePostCard(),
                    ProfileReelsCard(),
                    ProfileSaveCard(),
                  ]),
                )
              ],
            )),
      ),
    );
  }
}
