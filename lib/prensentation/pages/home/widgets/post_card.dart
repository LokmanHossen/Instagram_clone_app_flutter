import 'package:flutter/material.dart';
import 'package:instagram_clone_app/prensentation/pages/home/widgets/post_header.dart';
import 'package:instagram_clone_app/prensentation/pages/home/widgets/post_images.dart';

import 'post_footer.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.likeImagesList,
    required this.postData,
  });

  final List<String> likeImagesList;
  final Map<String, dynamic> postData;

  @override
  Widget build(BuildContext context) {
    var postImages = postData['postImages'] as List ?? [];
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
          if (postImages.isNotEmpty)
            PostImages(
              imageUrls: postImages,
            ),
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
          PostFooter(
            likeImagesList: likeImagesList,
            postData: postData,
          ),
        ],
      ),
    );
  }
}
