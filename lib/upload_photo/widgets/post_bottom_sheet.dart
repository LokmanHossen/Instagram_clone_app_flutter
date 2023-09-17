import 'package:flutter/material.dart';

class MediaBottomSheet {
  static show(context, Function() pickImages, Function() takePicture,
      Function() pickVideo) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Pick Image'),
              onTap: pickImages,
            ),
            ListTile(
              leading: const Icon(Icons.videocam),
              title: const Text('Pick Video'),
              onTap: pickVideo,
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take Picture'),
              onTap: takePicture,
            ),
          ],
        );
      },
    );
  }
}
