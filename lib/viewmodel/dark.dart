import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// DarkMode class

class DarkMode extends GetxController {
  var isDark = Get.isDarkMode.obs;

  void toggleDarkMode() {
    isDark.value = !isDark.value;
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);

    // Add logging to verify the isDark value
    log('Dark Mode Toggled: ${isDark.value}');
  }
}
