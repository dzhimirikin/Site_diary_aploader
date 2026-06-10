import 'dart:io';

class FolderService {

  List<File> getImages(String path) {

    final dir = Directory(path);

    return dir
        .listSync(recursive: true)
        .whereType<File>()
        .where((file) {

      final name =
          file.path.toLowerCase();

      return name.endsWith(".jpg") ||
             name.endsWith(".jpeg") ||
             name.endsWith(".png");

    }).toList();
  }
}
