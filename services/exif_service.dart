import 'dart:io';
import 'package:exif/exif.dart';

class ExifService {

  Future<DateTime?> getDate(File file) async {

    final bytes = await file.readAsBytes();

    final tags =
        await readExifFromBytes(bytes);

    final raw =
        tags['EXIF DateTimeOriginal']
            ?.printable;

    if (raw == null) {
      return null;
    }

    final parts = raw.split(' ');

    final date =
        parts[0].replaceAll(':', '-');

    return DateTime.parse(
      "$date ${parts[1]}"
    );
  }
}
