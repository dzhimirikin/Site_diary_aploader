import 'dart:io';
import 'package:image/image.dart' as img;

class ImageService {

  Future<List<int>> createFull(
      File file) async {

    final original =
        img.decodeImage(
            await file.readAsBytes());

    final resized =
        img.copyResize(
          original!,
          width: 1920,
        );

    return img.encodeWebP(
      resized,
      quality: 85,
    );
  }

  Future<List<int>> createThumb(
      File file) async {

    final original =
        img.decodeImage(
            await file.readAsBytes());

    final thumb =
        img.copyResize(
          original!,
          width: 400,
        );

    return img.encodeWebP(
      thumb,
      quality: 80,
    );
  }
}
