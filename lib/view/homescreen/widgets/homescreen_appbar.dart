import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gallery_application/model/const/images.dart';

class HomescreenAppBar extends StatelessWidget {
  const HomescreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double fontSize = 10;
    if (width < 360) {
      fontSize = 10;
    } else if (width < 600) {
      fontSize = 20;
    } else if (width < 1024) {
      fontSize = 25;
    } else {
      fontSize = 30;
    }
    return AppBar(
      leading: Row(
        children: [
          // const Spacer(),
          SvgPicture.asset(
            ImagePath.logo,
            width: width * 0.05,
            height: height * 0.05,
          ),
        ],
      ),
      title: Text(
        'Pixabay',
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: const [],
      automaticallyImplyLeading: false,
    );
  }
}
