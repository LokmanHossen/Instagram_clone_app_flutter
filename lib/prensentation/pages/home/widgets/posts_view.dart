import 'package:flutter/material.dart';
import 'package:instagram_clone_app/prensentation/pages/home/widgets/post_card.dart';

class PostsView extends StatefulWidget {
  const PostsView({
    super.key,
    required this.postData,
    required this.likeImagesList,
  });

  final List<Map<String, String>> postData;
  final List<String> likeImagesList;

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.postData.length,
        itemBuilder: (context, index) {
          return PostCard(
            likeImagesList: widget.likeImagesList,
            postData: widget.postData[index],
          );
        });
  }
}
