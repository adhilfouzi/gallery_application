import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../model/const/images.dart';
import '../../../viewmodel/dark.dart';

class HomescreenAppBar extends StatelessWidget {
  const HomescreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double fontSize = 10;
    if (width < 360) {
      fontSize = 15;
    } else if (width < 600) {
      fontSize = 22;
    } else if (width < 1024) {
      fontSize = 25;
    } else {
      fontSize = 30;
    }
    return AppBar(
      title: Text(
        'Pixabay',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
        ),
      ),
      actions: [
        Obx(
          () {
            var isDark = Get.put(DarkMode()).isDark.value;
            return CupertinoButton(
              child: SvgPicture.asset(
                isDark ? ImagePath.brightness : ImagePath.moon,
                color: isDark ? Colors.white : Colors.black,
              ),
              onPressed: () {
                Get.find<DarkMode>().toggleDarkMode();
              },
            );
          },
        ),
        SizedBox(
          width: width * 0.018,
        ),
      ],
      automaticallyImplyLeading: false,
    );
  }
}
