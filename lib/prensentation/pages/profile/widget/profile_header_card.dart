import 'package:flutter/material.dart';

class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
            color: Color(0xFF1B1B1B),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(40),
              bottomLeft: Radius.circular(40),
            )),
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
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                              'https://img.freepik.com/free-vector/hand-drawn-korean-drawing-style-character-illustration_23-2149623257.jpg?size=338&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr'),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 1.0,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.add_circle,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                const ProfileCountTitle(
                  count: '25',
                  title: 'Post',
                ),
                const CustomDivider(),
                const ProfileCountTitle(
                  count: '250K',
                  title: 'Followers',
                ),
                const CustomDivider(),
                const ProfileCountTitle(
                  count: '250',
                  title: 'Following',
                ),
              ],
            ),
            const Text(
              "Loko Man",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            const Text(
                "Software Developer || Flutter || Dart || Firebase || MySQL."),
            const SizedBox(
              height: 5,
            ),
            Text(
              ' BSc in Computer Science and Engineering-(CSE) at Pabna University of Science and Technology, PUST Dhaka,Bangladesh',
              style: TextStyle(color: Colors.grey.shade400),
            ),
            SizedBox(
              height: 30,
              child: TextButton(
                  onPressed: () {},
                  child: const Text("https://www.linkedin.com/in/lokman05/")),
            )
          ],
        ),
      ),
    );
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
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
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
      height: 40,
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Color(0xC4605555),
            width: 3.0,
          ),
        ),
      ),
    );
  }
}
