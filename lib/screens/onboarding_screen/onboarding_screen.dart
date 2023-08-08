import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lura/controllers/app_state_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final AppStateController _appStateController = Get.put(AppStateController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppStateController>(
      builder: (controller) {
        return Scaffold(
          body: controller.onboardingScreens[controller.activeIndexScreens],
        );
      }
    );
  }
}
