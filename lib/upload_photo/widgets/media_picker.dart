import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:video_compress/video_compress.dart';

class MediaPicker {
  final ImagePicker picker = ImagePicker();

  Future<List<Map<String, dynamic>>> pickImage() async {
    final PickedFiles = await picker.pickMultiImage();
    if (PickedFiles != null) {
      final mediaJsonList = <Map<String, dynamic>>[];
      for (var pickedFile in PickedFiles) {
        final id = DateTime.now().microsecondsSinceEpoch.toString();

        final mediaJson = {
          'id': id,
          'mediaFile': File(pickedFile.path).path,
          'mediatype': "image",
        };
        mediaJsonList.add(mediaJson);
      }
      return mediaJsonList;
    } else {
      return [];
    }
  }

  takePicture() async {
    final PickedFile = await picker.pickImage(source: ImageSource.camera);

    if (PickedFile != null) {
      final id = DateTime.now().microsecondsSinceEpoch.toString();
      final mediaJson = {
        'id': id,
        'mediaFile': File(PickedFile.path).path,
        'thumbnailFile': File(PickedFile.path).path,
        'mediaType': "image",
      };
      return mediaJson;
    } else {
      return null;
    }
  }

  videoPick() async {
    final PickedFile = await picker.pickVideo(source: ImageSource.gallery);

    if (PickedFile != null) {
      final thumbnailFile = await _getThumbnail(File(PickedFile.path));
      final id = DateTime.now().microsecondsSinceEpoch.toString();
      final mediaJson = {
        'id': id,
        'mediaFile': File(PickedFile.path).path,
        'thumbnailFile': thumbnailFile.path,
        'mediaType': "video",
      };
      return mediaJson;
    } else {
      return null;
    }
  }

  Future<File> _getThumbnail(File mediaFile) async {
    final thumbnailFile = await VideoCompress.getFileThumbnail(
      mediaFile.path,
      quality: 50,
      position: -1,
    );
    return thumbnailFile;
  }
}
