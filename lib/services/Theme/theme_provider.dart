import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var themeMode = ThemeMode.light.obs;
  var isDarkMode = false.obs;

  toggleTheme(value) {
    isDarkMode.value = !isDarkMode.value;
    themeMode = value ? ThemeMode.dark.obs : ThemeMode.light.obs;
    update();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff1B1B1E),
    colorScheme:  const ColorScheme.dark(),
      fontFamily: "Axiforma",
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff1B1B1E),
    ),
  );

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Color(0xffF9F9F9),
      colorScheme: const ColorScheme.light(),
      fontFamily: "Axiforma",
      appBarTheme:  AppBarTheme(
        titleTextStyle: TextStyle(
          color: Colors.black,
        ),
        backgroundColor: Color(0xffF9F9F9),
        iconTheme:  IconThemeData(
            color: Colors.black
        ),
      ),
      primaryIconTheme:  const IconThemeData(
          color: Color(0xff1B1B1E)
      ),
      iconTheme: const IconThemeData(
          color: Color(0xff1B1B1E)
      ),
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.black,
      leadingAndTrailingTextStyle: TextStyle(
        color: Colors.black
      ),
      subtitleTextStyle: TextStyle(
          color: Colors.black
      ),
      titleTextStyle: TextStyle(
          color: Colors.black
      ),
    )
  );
}