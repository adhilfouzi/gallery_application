import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gallery_application/model/const/images.dart';

class HomescreenAppBar extends StatelessWidget {
  const HomescreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return AppBar(
      leading: Row(
        children: [
          const Spacer(),
          SvgPicture.asset(
            ImagePath.logo,
            width: width * 0.05,
            height: height * 0.05,
            // color: Colors.black,
          ),
        ],
      ),
      title: const Text(
        'Pixabay',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            // Handle settings button tap
          },
          icon: Icon(Icons.settings),
        ),
      ],
      automaticallyImplyLeading: false, // Disable back button
    );
  }
}
