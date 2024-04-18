import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gallery_application/view/homescreen/homescreen.dart';

import 'viewmodel/dark.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(DarkMode());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pixabay Gallery',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode:
          Get.find<DarkMode>().isDark.value ? ThemeMode.dark : ThemeMode.light,
      home: const HomeScreen(),
    );
  }
}
