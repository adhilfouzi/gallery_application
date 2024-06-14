import 'package:flutter/material.dart';

import 'widget/iconbox.dart';
import 'widget/view_screen_appbar.dart';

class FullScreenImage extends StatelessWidget {
  final Map<String, dynamic> imageData;

  const FullScreenImage({super.key, required this.imageData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Hero(
              tag: imageData['id'],
              child: Image.network(
                imageData['largeImageURL'],
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
                child: ViewScreenAppBar(
                    user: imageData['user'], url: imageData['userImageURL'])),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: 0.8,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildInfoItem(
                      icon: Icons.remove_red_eye,
                      label: '${imageData['views']} ',
                    ),
                    buildInfoItem(
                      icon: Icons.file_download,
                      label: '${imageData['downloads']} ',
                    ),
                    buildInfoItem(
                      icon: Icons.favorite,
                      label: '${imageData['likes']} ',
                    ),
                    buildInfoItem(
                      icon: Icons.comment,
                      label: '${imageData['comments']} ',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
