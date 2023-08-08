import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lura/Widget/normalButton/normalButton.dart';
import 'package:lura/routes/app_routes/app_route_names.dart';

class CancelAnytimeBottomSheet {
  static showCancelAnytimeBottomSheet() {
    Get.bottomSheet(
      Container(
        height: 600,
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)
            )
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 5,
              width: 64,
              decoration: BoxDecoration(
                color: const Color(0xff757575),
                borderRadius: BorderRadius.circular(10)
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Cancel Anytime",
              style: TextStyle(
                  color: Color(0xff5D18EB),
                  fontSize: 20,
                  fontFamily: "AxiformaBold"
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "If your account isn’t cancelled before the trial ends, you will automatically be charged for 1 month of service.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff222823),
                  fontSize: 14
              ),
            ),
            Image.asset(
              "images/cancelAnytime.png"
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: (){},
              child: Container(
                height: 50,
                width: Get.width,
                decoration: BoxDecoration(
                    color: const Color(0xff5D18EB),
                    borderRadius: BorderRadius.circular(16)
                ),
                child: Center(
                  child: Text(
                    "Next",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "By continuing, you agree to the Terms and Conditions & Privacy and Policy applicable to Lura VPN.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff222823),
                  fontSize: 12
              ),
            ),
          ],
        ),
      )
    );
  }
}