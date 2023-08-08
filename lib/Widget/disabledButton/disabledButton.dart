import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisabledButton {
  static showDisabledButton (String text) {
    return InkWell(
      onTap: (){},
      child: Container(
        height: 50,
        width: Get.width,
        decoration: BoxDecoration(
            color: const Color(0xffF9F9F9),
            borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xffE2E4E2),
          )
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0xffA7AEA8),
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
