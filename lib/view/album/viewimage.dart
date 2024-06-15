import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/db_model/album_model.dart';
import 'db_functions.dart';

class ViewScreen extends StatelessWidget {
  final AlbumModel imageView;
  final AlbumController albumController = Get.find();

  ViewScreen({super.key, required this.imageView});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Image'),
        actions: [
          IconButton(
            onPressed: () {
              albumController.deleteData(imageView.id!);
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.delete),
          )
        ],
      ),
      body: GestureDetector(
        child: Center(child: Image.file(File(imageView.imagex))),
      ),
    );
  }
}
