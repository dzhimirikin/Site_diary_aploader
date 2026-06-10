import 'dart:io';

import 'exif_service.dart';
import 'image_service.dart';
import 'firebase_service.dart';

class UploadService {

  final exif = ExifService();

  final image = ImageService();

  final firebase =
      FirebaseService();

  Future<void> uploadFolder(
      Directory folder,
      String project) async {

    final files =
        folder.listSync();

    for (final entity in files) {

      if (entity is! File) {
        continue;
      }

      final date =
          await exif.getDate(entity);

      if (date == null) {
        continue;
      }

      final day =
          "${date.year}"
          "-${date.month.toString().padLeft(2,'0')}"
          "-${date.day.toString().padLeft(2,'0')}";

      final full =
          await image.createFull(entity);

      final thumb =
          await image.createThumb(entity);

      final name =
          entity.uri.pathSegments.last
          .replaceAll(".jpg", ".webp");

      await firebase.uploadBytes(
        path:
          "projects/$project/"
          "diary/$day/full/$name",
        bytes: full,
      );

      await firebase.uploadBytes(
        path:
          "projects/$project/"
          "diary/$day/thumb/$name",
        bytes: thumb,
      );
    }
  }
}
