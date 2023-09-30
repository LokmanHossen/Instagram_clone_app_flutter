// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:instagram_clone_app/prensentation/pages/auth/edit_profile.dart';

// class ProfileHeaderCard extends StatelessWidget {
//   const ProfileHeaderCard({
//     super.key,
//   });
//   // final String userId,
//   // CollectionReference users = FirebaseFirestore.instance.collection('users');

//   @override
//   Widget build(BuildContext context) {
//     return SliverToBoxAdapter(
//       child: Container(
//         padding: const EdgeInsets.all(12),
//         decoration: const BoxDecoration(
//             color: Color(0xFF1B1B1B),
//             borderRadius: BorderRadius.only(
//               bottomRight: Radius.circular(40),
//               bottomLeft: Radius.circular(40),
//             )),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Stack(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(
//                           width: 4,
//                           color: const Color(0xCAF15800),
//                         ),
//                       ),
//                       child: const Padding(
//                         padding: EdgeInsets.all(2.0),
//                         child: CircleAvatar(
//                           radius: 35,
//                           backgroundImage: NetworkImage(userData["profileUrl"]),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 10,
//                       right: 1.0,
//                       child: Container(
//                         decoration: const BoxDecoration(
//                             color: Colors.red, shape: BoxShape.circle),
//                         child: const Icon(
//                           Icons.add_circle,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),

//                 const SizedBox(
//                   width: 20,
//                 ),
//                 const ProfileCountTitle(
//                   count: '25',
//                   title: 'Post',
//                 ),
//                 const CustomDivider(),
//                 const ProfileCountTitle(
//                   count: '250K',
//                   title: 'Followers',
//                 ),
//                 const CustomDivider(),
//                 const ProfileCountTitle(
//                   count: '250',
//                   title: 'Following',
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   userData["userName"],
//                   style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
//                 ),
//                 IconButton(
//                     onPressed: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: ((context) => const EditProfile(userDetails: userData,))));
//                     },
//                     icon: Icon(Icons.edit))
//               ],
//             ),
//             const Text(userData["Bio"]),
//             const SizedBox(
//               height: 5,
//             ),
//             Text(
//               userData["des"],
//               style: TextStyle(color: Colors.grey.shade400),
//             ),
//             SizedBox(
//               height: 30,
//               child: TextButton(
//                   onPressed: () {}, child: const Text(userData["url"])),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ProfileCountTitle extends StatelessWidget {
//   const ProfileCountTitle({
//     super.key,
//     required this.count,
//     required this.title,
//   });
//   final String count;
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           count,
//           style: const TextStyle(
//             fontSize: 22,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//         Text(
//           title,
//           style: const TextStyle(fontSize: 16, color: Colors.grey),
//         )
//       ],
//     );
//   }
// }

// class CustomDivider extends StatelessWidget {
//   const CustomDivider({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 40,
//       margin: const EdgeInsets.only(
//         left: 20,
//         right: 20,
//       ),
//       decoration: const BoxDecoration(
//         border: Border(
//           right: BorderSide(
//             color: Color(0xC4605555),
//             width: 3.0,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_app/prensentation/pages/auth/edit_profile.dart';

// import '../../auth/edit_profile.dart';
class ProfileHeaderCard extends StatelessWidget {
  ProfileHeaderCard({
    super.key,
    required this.userId,
  });
  final String userId;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: FutureBuilder<DocumentSnapshot>(
      future: users.doc(userId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          print(data);
          return ProfileCard(
            userData: data,
          );
        }

        return const Text("loading");
      },
    ));
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.userData,
  });
  final Map<String, dynamic> userData;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
            color: Color(0xFF1B1B1B),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
                bottomLeft: Radius.circular(40))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: const Color(0xCAF15800),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: CircleAvatar(
                          radius: 45,
                          backgroundImage: NetworkImage(userData["profileUrl"]),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 5,
                      child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          child: const Icon(Icons.add_circle_outline)),
                    )
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                const ProfileCountTitle(
                  title: 'Post',
                  count: '25',
                ),
                const CustomDivider(),
                const ProfileCountTitle(
                  title: 'Followers',
                  count: '250K',
                ),
                const CustomDivider(),
                const ProfileCountTitle(
                  title: 'Following',
                  count: '250',
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  userData["userName"],
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w500),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => EditProfile(
                                userDetails: userData,
                              ))));
                    },
                    icon: const Icon(Icons.edit))
              ],
            ),
            Text(userData["bio"]),
            const SizedBox(
              height: 5,
            ),
            Text(
              userData["des"],
              style: TextStyle(color: Colors.grey.shade400),
            ),
            SizedBox(
              height: 30,
              child: TextButton(onPressed: () {}, child: Text(userData["url"])),
            )
          ],
        ));
  }
}

class ProfileCountTitle extends StatelessWidget {
  const ProfileCountTitle({
    super.key,
    required this.count,
    required this.title,
  });

  final String count;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        )
      ],
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      decoration: BoxDecoration(
          border: Border(
              right: BorderSide(
        color: Colors.grey.shade600,
        width: 2.0,
      ))),
    );
  }
}
