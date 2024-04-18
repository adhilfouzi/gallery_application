import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewScreenAppBar extends StatelessWidget {
  final String url;
  final String user;
  const ViewScreenAppBar({super.key, required this.user, required this.url});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(CupertinoIcons.back)),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundImage: NetworkImage(url),
          ),
          SizedBox(width: width * 0.02),
          Text(
            user,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
      centerTitle: true,
    );
  }
}
