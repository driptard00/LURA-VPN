import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lura/routes/app_routes/app_route_names.dart';

import '../../../Widget/onboardingButtons/button1.dart';
import '../../../Widget/onboardingButtons/button2.dart';
import '../../../controllers/app_state_controller.dart';

class Screen3 extends StatelessWidget {
  Screen3({super.key});

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
                  left: 10,
                  right: 10,
                  bottom: 10,
                  top: 10,
                  child: Image.asset(
                    "images/world map.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Image.asset(
                    "images/rightEclipse.png",
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Image.asset(
                    "images/leftEclipse.png",
                  ),
                ),
                Container(
                  height: Get.height,
                  width: Get.width,
                  child: Column(
                    children: [
                      Image.asset(
                        "images/world.png",
                        width: Get.width,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child:  Text(
                          "More to browse, faster and safer with Lura.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontFamily: "AxiformaBold"
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20),
                        child:  Text(
                          "Keep your online activity and data shielded from malicious cyber attacks.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          ),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            OnboardingButton2.showOnboardingButton2((){
                              Get.toNamed(loginScreen);
                            }, "Login"),
                            const SizedBox(
                              height: 20,
                            ),
                            OnboardingButton1.showOnboardingButton1(
                                    (){Get.toNamed(signUpScreen);}
                                , "Continue with Email", Icons.mail_outline)
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "©2023, Lura Inc. All Rights Reserved",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}
