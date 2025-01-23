import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final Function(File? image) onPickImage;
  const UserImagePicker({super.key, required this.onPickImage});

  @override
  State<UserImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<UserImagePicker> {
  void _pickImage() async {
    final pickedImage = await ImagePicker()
        .pickImage(source: ImageSource.gallery, maxWidth: 200);
    if (pickedImage == null) {
      return;
    }
    setState(() {
      _pickedImage = File(pickedImage.path);
    });
    widget.onPickImage(_pickedImage);
  }

  File? _pickedImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        foregroundImage: _pickedImage != null ? FileImage(_pickedImage!) : null,
        radius: 40,
        child: Icon(
          Icons.add,
          size: 30,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
