import 'package:firebase_storage/firebase_storage.dart';

class FirebaseService {

  final storage =
      FirebaseStorage.instance;

  Future<void> uploadBytes({
    required String path,
    required List<int> bytes,
  }) async {

    await storage
        .ref(path)
        .putData(bytes);
  }
}
