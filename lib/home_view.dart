import 'package:flutter/material.dart';

class HomeViewScreen extends StatefulWidget {
  const HomeViewScreen({super.key});

  @override
  State<HomeViewScreen> createState() => _HomeViewScreenState();
}

class _HomeViewScreenState extends State<HomeViewScreen> {
  var storyData = [
    {
      'imageUrl':
          'https://img.freepik.com/free-vector/realistic-samurai-illustrated-background_52683-69460.jpg?w=740&t=st=1686137185~exp=1686137785~hmac=390704896744102739b13593a6ee86ac579820b437588272dda37641c152fe9b',
      'userName': 'user1f',
    },
    {
      'imageUrl':
          'https://img.freepik.com/free-vector/little-blond-boy-anime_18591-77251.jpg?size=626&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr',
      'userName': 'user2',
    },
    {
      'imageUrl':
          'https://img.freepik.com/premium-vector/heart-girl-anime-character_603843-485.jpg?size=626&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr',
      'userName': 'user3',
    },
    {
      'imageUrl':
          'https://img.freepik.com/free-photo/girl-with-backpack-sunset-generative-al_169016-28612.jpg?size=338&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr',
      'userName': 'user4',
    },
    {
      'imageUrl':
          'https://img.freepik.com/premium-vector/character-design-girl-bring-stick_286658-173.jpg?size=626&ext=jpg&ga=GA1.1.647470437.1685963067&semt=robertav1_2_sidr',
      'userName': 'user5',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'InstaFeed',
                  style: TextStyle(fontSize: 30),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.radio_button_unchecked,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            Icon(Icons.message),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ProfileStoryCard(),
                ListView.builder(
                  itemCount: storyData.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return StoryCard(
                      profileImage: storyData[index]['imageUrl']!,
                      userName: storyData[index]['userName']!,
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class StoryCard extends StatefulWidget {
  const StoryCard(
      {super.key, required this.profileImage, required this.userName});
  final String profileImage;
  final String userName;

  @override
  State<StoryCard> createState() => _StoryCardState();
}

class _StoryCardState extends State<StoryCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 4, color: Colors.grey),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(widget.profileImage),
              ),
            ),
          ),
          const SizedBox(
            height: 2.0,
          ),
          Text(widget.userName)
        ],
      ),
    );
  }
}

class ProfileStoryCard extends StatelessWidget {
  const ProfileStoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 4, color: Colors.grey),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-vector/hand-drawn-korean-drawing-style-character-illustration_23-2149623257.jpg?size=338&ext=jpg&ga=GA1.2.647470437.1685963067&semt=robertav1_2_sidr'),
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 20,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 3.0, color: Colors.white)),
            child: const Icon(
              Icons.add_circle,
              size: 30,
              color: Colors.orange,
            ),
          ),
        ),
      ],
    );
  }
}
