import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lura/screens/onboarding_screen/screens/screen1.dart';
import 'package:lura/screens/onboarding_screen/screens/screen2.dart';
import 'package:lura/screens/onboarding_screen/screens/screen3.dart';

class AppStateController extends GetxController {

  // instant variables
  List<Widget> _onboardingScreens = [
    Screen1(),
    Screen2(),
    Screen3()
  ];
  List<String> _languages = [
    "English",
    "German",
    "French",
    "Spanish",
    "Japanese",
    "Italian",
    "Arabic",
    "Russian",
  ];
  int _activeIndexScreen = 0;
  String _selectedLanguage = "";

  // getters
  List get onboardingScreens => _onboardingScreens;
  List get languages => _languages;
  int get activeIndexScreens => _activeIndexScreen;
  String get selectedLanguage => _selectedLanguage;

  // setters
  updateActiveIndex(value) {
    _activeIndexScreen = value;
    update();
  }
  updateSelectedLanguage(value) {
    _selectedLanguage = value;
    update();
  }
}