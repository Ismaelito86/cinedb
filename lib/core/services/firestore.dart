// ignore_for_file: avoid_print
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FireStoreService {
  static Future<String> uploadImage(File image) async {
    final String namefile = image.path.split("/").last;

    final Reference ref =
        FirebaseStorage.instance.ref().child('images').child(namefile);

    final UploadTask uploadTask = ref.putFile(image);

    final TaskSnapshot snapshot = await uploadTask.whenComplete(() => true);

    final String url = await snapshot.ref.getDownloadURL();

    if (snapshot.state == TaskState.success) {
      return url;
    }

    return '';
  }
}
