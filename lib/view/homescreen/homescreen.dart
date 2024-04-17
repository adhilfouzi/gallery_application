import 'package:flutter/material.dart';
import 'widgets/homescreen_appbar.dart';
import 'widgets/image_grid.dart';

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
