import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../model/const/images.dart';
import '../../../viewmodel/dark.dart';
import '../../../viewmodel/image_view_model.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;

  const SearchTextField({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, height * 0.01),
      child: GetBuilder<ImageViewModel>(
        init: ImageViewModel(),
        builder: (controller) {
          return TextField(
            controller: controller.textEditingController,
            onChanged: onChanged,
            autocorrect: true,
            decoration: InputDecoration(
              hintText: 'Search...',
              prefixIcon: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.02, vertical: height * 0.02),
                child: Obx(() => SvgPicture.asset(ImagePath.search,
                    color: Get.find<DarkMode>().isDark.value
                        ? Colors.white
                        : Colors.black)),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        },
      ),
    );
  }
}
