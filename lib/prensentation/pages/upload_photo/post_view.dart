import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instagram_clone_app/prensentation/pages/upload_photo/widgets/media_picker.dart';
import 'package:instagram_clone_app/prensentation/pages/upload_photo/widgets/post_bottom_sheet.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  var mediaPicker = MediaPicker();

  final List<Map<String, dynamic>> _mediaFiles = [];

  void pickImgaes() async {
    var pickFiles = await mediaPicker.pickImage();
    if (pickFiles != null) {
      setState(() {
        _mediaFiles.addAll(pickFiles);
      });
    }
    Navigator.pop(context);
  }

  Future<void> takePicture() async {
    var pickFile = await mediaPicker.takePicture();
    if (pickFile != null) {
      setState(() {
        _mediaFiles.add(pickFile);
      });
    }
    Navigator.pop(context);
  }

  Future<void> pickVideo() async {
    var pickFile = await mediaPicker.videoPick();
    if (pickFile != null) {
      setState(() {
        _mediaFiles.add(pickFile);
      });
    }
    Navigator.pop(context);
  }

  removeMedia(index) {
    setState(() {
      _mediaFiles.removeAt(index - 1);
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 66, 53)),
          onPressed: () {},
          child: const Text("Post")),
      appBar: AppBar(title: const Text("Upload Post")),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Write Something"),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      hintText: 'Description',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 53, 53, 53)),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: _mediaFiles.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: IconButton(
                        onPressed: () {
                          MediaBottomSheet.show(
                              context, pickImgaes, takePicture, pickVideo);
                        },
                        icon: const Icon(Icons.add_a_photo)),
                  );
                }
                var mediaFile = _mediaFiles[index - 1];
                var thumbnailFile = File(mediaFile['thumbnailFile']);
                var isVideo = mediaFile['mediaType'] == 'video';
                return InkWell(
                  onLongPress: () {
                    RemoveMediaBottomSheet.show(context, () {
                      removeMedia(index);
                    });
                  },
                  child: Stack(
                    children: [
                      Image.file(thumbnailFile,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover),
                      if (isVideo)
                        const Align(
                            alignment: Alignment.center,
                            child: Icon(Icons.play_circle_filled,
                                size: 40, color: Colors.white))
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}