import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../model/db_model/album_model.dart';
import 'db_functions.dart';
import 'viewimage.dart';

class AlbumScreen extends StatelessWidget {
  AlbumScreen({super.key});
  final AlbumController albumController = Get.put(AlbumController());

  Future<void> getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) {
      return;
    }

    final imagePath = image.path.toString();
    final stdData = AlbumModel(imagex: imagePath);
    albumController.addData(stdData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Camera App'), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (albumController.albumimages.isEmpty) {
                return const Center(
                    child: Text(
                  'Album is Empty.....',
                  style: TextStyle(fontSize: 18),
                ));
              } else {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: albumController.albumimages.length,
                  itemBuilder: (BuildContext context, int index) {
                    final pathdata = albumController.albumimages[index];
                    return InkWell(
                      child: Card(
                        elevation: 5,
                        child: Image.file(
                          File(
                            pathdata.imagex,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      onTap: () => Get.to(ViewScreen(imageView: pathdata)),
                    );
                  },
                );
              }
            }),
          ),
          Container(
            width: double.infinity,
            color: Colors.black12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    getImage(ImageSource.gallery);
                  },
                  icon: const Icon(Icons.photo_album_outlined),
                ),
                IconButton(
                  onPressed: () {
                    getImage(ImageSource.camera);
                  },
                  icon: const Icon(Icons.camera),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
