import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_app/prensentation/pages/auth/login_screen.dart';
import 'package:instagram_clone_app/prensentation/pages/profile/widget/profile_header_card.dart';
import 'package:instagram_clone_app/prensentation/pages/profile/widget/profile_post_card.dart';
import 'package:instagram_clone_app/prensentation/pages/profile/widget/profile_reels_card.dart';
import 'package:instagram_clone_app/prensentation/pages/profile/widget/profile_save_card.dart';

// class ProfileView extends StatelessWidget {
//   const ProfileView({super.key, required this.userId});

//   final String userId;

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       initialIndex: 0,
//       length: 3,
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         appBar: AppBar(
//           elevation: 0,
//           leading:
//               IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
//           backgroundColor: const Color(0xFF1B1B1B),
//           title: const Text('Profile'),
//           actions: [
//             IconButton(
//                 onPressed: () {},
//                 icon: const Badge(
//                     textColor: Colors.white,
//                     label: Text('5'),
//                     child: Icon(Icons.notifications))),
//             PopupMenuButton(
//               child: const Icon(Icons.more_vert),
//               itemBuilder: (context) {
//                 return [
//                   PopupMenuItem(
//                       child: ListTile(
//                     leading: const Icon(Icons.logout),
//                     title: const Text("Logout"),
//                     onTap: () async {
//                       await FirebaseAuth.instance.signOut();
//                       Navigator.of(context).pushReplacement(MaterialPageRoute(
//                           builder: ((context) => const LogInScreen())));
//                     },
//                   ))
//                 ];
//               },
//             ),
//             // IconButton(
//             //   onPressed: () {},
//             //   icon: const Icon(Icons.more_vert),
//             // ),
//           ],
//         ),
//         body: NestedScrollView(
//             headerSliverBuilder: (context, value) {
//               return [
//                 ProfileHeaderCard(
//                   userId: userId,
//                 ),
//               ];
//             },
//             body: Column(
//               children: [
//                 const TabBar(tabs: [
//                   Tab(icon: Icon(Icons.add_a_photo)),
//                   Tab(icon: Icon(Icons.play_circle_outline)),
//                   Tab(icon: Icon(Icons.bookmark_outline)),
//                 ]),
//                 Expanded(
//                   child: TabBarView(children: [
//                     ProfilePostCard(),
//                     ProfileReelsCard(),
//                     ProfileSaveCard(),
//                   ]),
//                 )
//               ],
//             )),
//       ),
//     );
//   }
// }

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.userId});
  final String userId;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
            backgroundColor: Color(0xFF1B1B1B),
            title: Text("Profile"),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Badge(
                      textColor: Colors.white,
                      label: Text("5"),
                      child: Icon(Icons.notifications))),
              PopupMenuButton(
                  child: Icon(Icons.more_vert),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                          child: ListTile(
                        leading: Icon(Icons.logout),
                        title: Text("Logout"),
                        onTap: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: ((context) => LogInScreen())));
                        },
                      ))
                    ];
                  })
            ],
          ),
          body: NestedScrollView(
              headerSliverBuilder: (context, value) {
                return [
                  ProfileHeaderCard(
                    userId: userId,
                  )
                ];
              },
              body: Column(
                children: [
                  TabBar(tabs: [
                    Tab(
                      icon: Icon(Icons.add_a_photo),
                    ),
                    Tab(
                      icon: Icon(Icons.play_circle_outline),
                    ),
                    Tab(
                      icon: Icon(Icons.bookmark_outline),
                    ),
                  ]),
                  Expanded(
                    child: TabBarView(children: [
                      ProfilePostCard(),
                      ProfileReelsCard(),
                      ProfileSaveCard(),
                    ]),
                  )
                ],
              ))),
    );
  }
}
