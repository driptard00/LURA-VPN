import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NormalButton {
  static showNormalButton (dynamic onPressed, String text) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: Get.width,
        decoration: BoxDecoration(
          color: const Color(0xff5D18EB),
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
