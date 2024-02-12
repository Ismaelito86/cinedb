import 'dart:io';

import 'package:cinedb/core/services/camera.dart';
import 'package:cinedb/core/services/firestore.dart';
import 'package:cinedb/domain/entities/profile.dart';
import 'package:cinedb/domain/repositories/local_repository.dart';
import 'package:cinedb/domain/repositories/movies_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileProvider extends ChangeNotifier {
  final movieRepo = Get.find<MoviesRepository>();
  final profileRepo = Get.find<LocalRepository>();

  Profile profile = Profile(
    name: 'user_test',
    email: 'test@gmail.com',
    avatar:
        'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8dXNlcnN8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
  );

  ProfileProvider() {
    loadProfile();
  }

  final CameraGalleryService _imagePicker = CameraGalleryService();

  void loadProfile() async {
    profile = await profileRepo.loadProfile() ?? profile;

    notifyListeners();
  }

  Future<String> updloadImageToFireStore() async {
    final image = await _imagePicker.selectImage();
    if (image == null) {
      return '';
    }
    final response = await FireStoreService.uploadImage(File(image.path));
    profile.avatar = response;

    profileRepo.updateProfile(profile);

    notifyListeners();
    return response;
  }
}
