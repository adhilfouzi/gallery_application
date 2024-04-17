import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/data_provider/pixa_data_provider.dart';
import 'image_tile.dart';

class ImageGrid extends StatelessWidget {
  const ImageGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<PixaController>(
      init: PixaController(),
      builder: (controller) {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return GridView.custom(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 4,
              childAspectRatio: 3 / 4, // Aspect ratio adjusted to 3:4
            ),
            childrenDelegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index < controller.images.length) {
                  return ImageTile(imageData: controller.images[index]);
                } else {
                  return Container();
                }
              },
              childCount: controller.images.length, // Set the childCount
            ),
          );
        }
      },
    );
  }
}
