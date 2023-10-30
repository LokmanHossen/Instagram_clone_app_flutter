import 'package:flutter/material.dart';

import 'like_images.dart';

class PostFooter extends StatelessWidget {
  const PostFooter({
    super.key,
    required this.likeImagesList,
  });

  final List<String> likeImagesList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
    );
  }
}
