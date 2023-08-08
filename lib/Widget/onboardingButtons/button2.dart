import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingButton2 {
  static showOnboardingButton2 (dynamic onPressed, String text) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: Get.width,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xffA588FF),
              Color(0xff4F1DED),
              Color(0xff913BD6),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight
          ),
          borderRadius: BorderRadius.circular(16)
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
