import 'package:image_picker/image_picker.dart';

class CameraGalleryService {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> selectImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image == null) return null;

    return image;
  }

  Future<XFile?> takeImage() async {
    final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
        preferredCameraDevice: CameraDevice.rear);

    if (image == null) return null;

    return image;
  }
}
