import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, height * 0.01),
      child: GetBuilder<ImageViewModel>(
        init: ImageViewModel(),
        builder: (controller) {
          return TextField(
            controller: controller.textEditingController,
            onChanged: onChanged,
            autocorrect: true,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: 'Search...',
              prefixIcon: const Icon(Icons.search),
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
