import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyImageProvider extends ChangeNotifier {
  PickedFile? imageFile;

  openGallery() async {
    final _image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    imageFile = File(_image!.path) as PickedFile?;

    // Navigator.pop(this.context);
    notifyListeners();
  }

  openCamera() async {
    final _image = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    imageFile = File(_image!.path) as PickedFile?;

    // Navigator.pop(this.context);
    notifyListeners();
  }
}
