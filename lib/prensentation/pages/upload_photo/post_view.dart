import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_app/prensentation/pages/upload_photo/widgets/media_picker.dart';
import 'package:instagram_clone_app/prensentation/pages/upload_photo/widgets/post_bottom_sheet.dart';
import 'package:instagram_clone_app/services/firestore_service.dart';
import 'package:uuid/uuid.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  var mediaPicker = MediaPicker();
  List<Map<String, dynamic>> _mediaFiles = [];
  final _desController = TextEditingController();
  var imageUrlList = [];
  var isLoader = false;
  final firestoreService = FirestoreService();

  void pickImgaes() async {
    Navigator.pop(context);
    var pickFiles = await mediaPicker.pickImage();
    if (pickFiles.isNotEmpty) {
      setState(() {
        _mediaFiles.addAll(pickFiles);
      });
    }
  }

  Future<void> takePicture() async {
    Navigator.pop(context);

    var pickFile = await mediaPicker.takePicture();
    if (pickFile.isNotEmpty) {
      setState(() {
        _mediaFiles.add(pickFile);
      });
    }
  }

  Future<void> pickVideo() async {
    Navigator.pop(context);
    var pickFile = await mediaPicker.videoPick();
    if (pickFile.isNotEmpty) {
      setState(() {
        _mediaFiles.add(pickFile);
      });
    }
  }

  var uuid = const Uuid();
  uploadFile() async {
    for (var i in _mediaFiles) {
      var imageUrl =
          await firestoreService.uploadFile(File(i['thumbnailFile']));
      setState(() {
        imageUrlList.add(imageUrl);
      });
    }
  }

  uploadPost() async {
    setState(() {
      isLoader = false;
    });
    await uploadFile();
    var id = uuid.v4();
    var createAt = DateTime.now().microsecondsSinceEpoch;

    var postData = {
      "id": id,
      "userId": FirebaseAuth.instance.currentUser!.uid,
      "createAt": createAt,
      "linksImages": [],
      "commentsCount": 0,
      "likesCouont": 0,
      "description": _desController.text,
      "postImages": imageUrlList,
    };
    try {
      await firestoreService.addPost(postData);
      setState(() {
        isLoader = true;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Post Uploaded')));
    } catch (error) {
      setState(() {
        isLoader = false;
      });
    } finally {
      setState(() {
        _desController.clear();
        _mediaFiles = [];
      });
    }
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
      floatingActionButton: SizedBox(
        height: 40,
        width: 90,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 66, 53)),
            onPressed: () {
              if (isLoader) {
              } else {
                uploadPost();
              }
            },
            child: isLoader
                ? const Center(child: CircularProgressIndicator())
                : const Text("Post")),
      ),
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
                  controller: _desController,
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
                ),
                const SizedBox(
                  height: 10,
                ),
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                                MediaBottomSheet.show(context, pickImgaes,
                                    takePicture, pickVideo);
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
          ),
        ],
      ),
    );
  }
}
