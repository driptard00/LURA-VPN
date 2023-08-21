import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lura/Widget/normalButton/normalButton.dart';
import 'package:lura/routes/api/api_routes.dart';
import 'package:lura/routes/app_routes/app_route_names.dart';

import '../../controllers/app_state_controller.dart';

final AppStateController _appStateController = Get.find<AppStateController>();

class CancelAnytimeBottomSheet {
  static showCancelAnytimeBottomSheet(subID) {
    Get.bottomSheet(
     GetBuilder<AppStateController>(
       builder: (controller) {
         return Container(
            height: 600,
            width: Get.width,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration:  BoxDecoration(
                color: (_appStateController.isDarkMode.value)?
                Color(0xff1A1919)
                    :
                Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)
                )
            ),
            child: SingleChildScrollView(
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
                    onTap: (){
                      (subID == 5)?
                      Get.toNamed(loginScreen)
                      :
                      (subID == 1)?
                      controller.createPaymentIntent(subID)
                      :
                      (subID == 2)?
                      controller.createPaymentIntent(subID)
                      :
                      null;
                    },
                    child: Container(
                      height: 50,
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: const Color(0xff5D18EB),
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: const Center(
                        child: Text(
                          "Next",
                          style:  TextStyle(
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
                        fontSize: 12
                    ),
                  ),
                ],
              ),
            ),
          );
       }
     )
    );
  }
}