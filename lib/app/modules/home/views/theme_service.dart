import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeServices
{
  final box = GetStorage();
  final key = "isDarkMode";

  _saveThemeToBox(bool isDarkMode) => box.write(key, isDarkMode);

  bool _loadThemeFromBox() => box.read(key)??false;
  ThemeMode get theme => _loadThemeFromBox()?ThemeMode.dark:ThemeMode.light;

  void switchTheme()
  {
    Get.changeThemeMode(_loadThemeFromBox()?ThemeMode.light:ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }
}