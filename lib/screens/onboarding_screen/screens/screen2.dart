import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../Widget/onboardingButtons/button1.dart';
import '../../../controllers/app_state_controller.dart';

class Screen2 extends StatelessWidget {
   Screen2({super.key});

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
                    "images/blueBack.png",
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
                            Image.asset(
                              "images/clock.png",
                            ),
                            const Text(
                              "Super Fast",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontFamily: "AxiformaBold"
                              ),
                            ),
                            const  Text(
                              "Lightning Servers",
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
                              "Get the speed you need for all your online activities. ",
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
                                    (){controller.updateActiveIndex(2);}
                                , "Get Started", Iconsax.arrow_right_1)
                          ],
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
