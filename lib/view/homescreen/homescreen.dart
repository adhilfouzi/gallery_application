import 'package:flutter/material.dart';
import 'package:gallery_application/view/homescreen/widgets/search_view.dart';
import 'package:gallery_application/viewmodel/image_view_model.dart';
import 'package:get/get.dart';
import 'widgets/homescreen_appbar.dart';
import 'widgets/image_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: HomescreenAppBar(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.02, vertical: height * 0.02),
        child: Column(
          children: [
            SearchTextField(
              onChanged: (query) {
                Get.find<ImageViewModel>().fetchData();
              },
            ),
            const Expanded(
              child: ImageGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
