import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../../../viewmodel/image_view_model.dart';
import 'image_tile.dart';

class ImageGrid extends StatelessWidget {
  const ImageGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    int crossAxisCount = 0;
    if (width < 360) {
      crossAxisCount = 2;
    } else if (width < 600) {
      crossAxisCount = 2;
    } else if (width < 1024) {
      crossAxisCount = 3;
    } else {
      crossAxisCount = 4;
    }

    return Column(
      children: [
        Expanded(
          child: GetX<ImageViewModel>(
            init: ImageViewModel(),
            builder: (controller) {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                List<Map<String, dynamic>> filteredImages =
                    controller.filteredImages;
                if (filteredImages.isNotEmpty) {
                  return LiquidPullToRefresh(
                    showChildOpacityTransition: false,
                    color: Colors.lightBlueAccent,
                    onRefresh: () => Get.find<ImageViewModel>().fetchData(),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 4,
                        childAspectRatio: 3 / 4,
                      ),
                      itemCount: filteredImages.length,
                      itemBuilder: (context, index) {
                        return ImageTile(imageData: filteredImages[index]);
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: Text(controller.errorMessage.value),
                  );
                }
              }
            },
          ),
        ),
      ],
    );
  }
}
