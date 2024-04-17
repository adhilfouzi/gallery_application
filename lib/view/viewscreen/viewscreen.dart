import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullScreenImage extends StatelessWidget {
  final Map<String, dynamic> imageData;

  const FullScreenImage({super.key, required this.imageData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Full Screen Image'),
      ),
      body: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Center(
          child: Image.network(
            imageData['largeImageURL'],
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
