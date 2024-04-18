import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../viewscreen/viewscreen.dart';

class ImageTile extends StatelessWidget {
  final Map<String, dynamic> imageData;

  const ImageTile({super.key, required this.imageData});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    double fontSize = 10;
    if (width < 360) {
      fontSize = 8;
    } else if (width < 600) {
      fontSize = 10;
    } else if (width < 1024) {
      fontSize = 14;
    } else {
      fontSize = 18;
    }
    return GestureDetector(
      onTap: () {
        Get.to(FullScreenImage(imageData: imageData),
            transition: Transition.leftToRightWithFade);
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageData['webformatURL'],
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black87, Colors.transparent],
                  ),
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0, vertical: height * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 16,
                    ),
                    SizedBox(width: width * 0.002),
                    Text(
                      '${imageData['likes']}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize,
                      ),
                    ),
                    SizedBox(width: width * 0.05),
                    const Icon(
                      Icons.remove_red_eye,
                      color: Colors.white,
                      size: 16,
                    ),
                    SizedBox(width: width * 0.002),
                    Text(
                      '${imageData['views']}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: fontSize,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
