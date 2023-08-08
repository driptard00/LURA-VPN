import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingButton1 {
  static showOnboardingButton1 (dynamic onPressed, String text, IconData icon) {
    return SizedBox(
      height: 50,
      width: Get.width,

      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: const Color(0xff5D18EB),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(
              icon,
              color: Colors.white,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
