import 'package:flutter/material.dart';
import 'package:instagram_clone_app/prensentation/pages/home/widgets/post_images.dart';

import 'like_images.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.likeImagesList,
    required this.postData,
  });

  final List<String> likeImagesList;
  final dynamic postData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostHeader(postData: postData),
          const SizedBox(
            height: 15,
          ),
          PostImages(),
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(10),
          //   child: Image.network(
          //     postData['imageUrl'],
          //     height: 280,
          //     width: double.infinity,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  LikesImages(
                    likeImages: likeImagesList,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text("15 Likes",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(Icons.favorite_border_outlined),
                  const SizedBox(
                    width: 15,
                  ),
                  const Icon(Icons.message_outlined),
                ],
              ),
              const Icon(Icons.bookmark_border_outlined),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "View All 48 comments",
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  const PostHeader({
    super.key,
    required this.postData,
  });

  final dynamic postData;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(children: [
        CircleAvatar(
          radius: 35,
          backgroundImage: NetworkImage(postData['profileImage']),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              postData['userName'],
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const Text('15 mins ago', style: TextStyle(color: Colors.white38))
          ],
        )
      ]),
      const Icon(Icons.more_vert)
    ]);
  }
}
