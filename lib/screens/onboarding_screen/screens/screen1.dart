import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lura/Widget/onboardingButtons/button1.dart';
import 'package:lura/controllers/app_state_controller.dart';

import '../../../Widget/onboardingButtons/button2.dart';

class Screen1 extends StatelessWidget {
   Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppStateController>(
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              Container(
                height: Get.height,
                width: Get.width,
                color: Colors.black,
              ),
              Positioned(
                left: 0,
                right: 0,
                child: Image.asset(
                  "images/greenBack.png",
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                child: Image.asset(
                  "images/purple.png",
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                child: Container(
                  height: Get.height,
                  width: Get.width,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Image.asset(
                            "images/LURa.png",
                            height: 16,
                            width: 92,
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Image.asset(
                            "images/wing.gif",
                            height: 250,
                            width: 250,
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          const Text(
                            "Cutting Edge",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                              fontFamily: "AxiformaBold"
                            ),
                          ),
                          const  Text(
                            "Robust Encryption",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff09B47C),
                                fontSize: 32,
                                fontFamily: "AxiformaBold"
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            "Say goodbye to digital threats and hackers with Lura.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          DotsIndicator(
                            dotsCount: controller.onboardingScreens.length,
                            position: controller.activeIndexScreens,
                            decorator: DotsDecorator(
                              size: const Size.square(9.0),
                              activeSize: const Size(40.0, 9.0),
                              activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                              activeColor: Colors.white
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),

                          OnboardingButton1.showOnboardingButton1(
                              (){controller.updateActiveIndex(1);}
                          , "Get Started", Iconsax.arrow_right_1)
                        ],
                      ),
                    ),
                  ),
                )
              ),
            ],
          ),
        );
      }
    );
  }
}
