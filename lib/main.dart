import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gallery_application/view/homescreen/utils/homescreen_appbar.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pixabay Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: HomescreenAppBar(),
      ),
      body: ImageGrid(),
    );
  }
}

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

class ImageTile extends StatelessWidget {
  final Map<String, dynamic> imageData;

  const ImageTile({Key? key, required this.imageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(FullScreenImage(imageData: imageData));
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
                decoration: BoxDecoration(
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
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '${imageData['likes']}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(width: 16),
                    Icon(
                      Icons.remove_red_eye,
                      color: Colors.white,
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '${imageData['views']}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
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

class PixaController extends GetxController {
  var images = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    try {
      var response = await http.get(Uri.parse(
          'https://pixabay.com/api/?key=37775942-8c9d29341ec492be8cdeb5544'));
      var decodedResponse = jsonDecode(response.body);
      images.assignAll(List.from(decodedResponse['hits']));
    } catch (e) {
      log('Error fetching data: $e');
    } finally {
      isLoading(false);
    }
  }
}
