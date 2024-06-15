import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'model/db_model/album_model.dart';
import 'view/head/bottom_bar.dart';
import 'viewmodel/dark.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AlbumModelAdapter());
  await Hive.openBox<AlbumModel>('albums');
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
      home: const MyBottomNavigationBar(),
    );
  }
}
