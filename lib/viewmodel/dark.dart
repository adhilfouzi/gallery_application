import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DarkMode extends GetxController {
  var isDark = Get.isDarkMode.obs;

  void toggleDarkMode() {
    isDark.value = !isDark.value;
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);

    log('Dark Mode Toggled: ${isDark.value}');
  }
}
