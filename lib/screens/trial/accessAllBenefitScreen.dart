import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lura/Widget/normalButton/normalButton.dart';
import 'package:lura/Widget/onboardingButtons/button1.dart';
import 'package:lura/routes/app_routes/app_route_names.dart';

import '../../Widget/bottomSheets/cancelAnytime.dart';

class AccessAllBenefitScreen extends StatelessWidget {
  const AccessAllBenefitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: const Color(0xffF9F9F9),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: (){
                      Get.back();
                    },
                    child: const Icon(
                      Iconsax.arrow_left,
                      color: Color(0xff222823),
                      size: 24,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Access All Benefits",
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
                  "Get access to all of Lura’s benefits and features.",
                  style: TextStyle(
                      color: Color(0xff6E796F),
                      fontSize: 14
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Color(0xffA38CEE),
                              Color(0xffA38CEE).withOpacity(0.1),
                            ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter
                        )
                        ,
                        borderRadius: BorderRadius.circular(17)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        width: Get.width,
                        padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                        decoration: BoxDecoration(color: Colors.white,
                          borderRadius: BorderRadius.circular(16)
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              const Expanded(
                                flex: 9,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "3-Day Free Trial",
                                      style: TextStyle(
                                          color: Color(0xff222823),
                                          fontSize: 16,
                                          fontFamily: "AxiformaBold"
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Discover everything Lura has to offer and trial our most popular features.",
                                      style: TextStyle(
                                          color: Color(0xff222823),
                                          fontSize: 14
                                      ),
                                    ),
                                    Text(
                                      "Free",
                                      style: TextStyle(
                                          color: Color(0xff222823),
                                          fontSize: 14,
                                          fontFamily: "AxiformaBold"
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Checkbox(
                                  value: true,
                                  activeColor: const Color(0xff09B47C),
                                  onChanged: (value){},

                                ),
                              )
                            ],
                          )
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Color(0xff76DFFF),
                              Color(0xffA38CEE).withOpacity(0.1),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter
                        )
                        ,
                        borderRadius: BorderRadius.circular(17)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        width: Get.width,
                        padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                        decoration: BoxDecoration(color: Colors.white,
                            borderRadius: BorderRadius.circular(16)
                        ),
                        child: Center(
                            child: Row(
                              children: [
                                const Expanded(
                                  flex: 9,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Monthly Subscription",
                                        style: TextStyle(
                                            color: Color(0xff222823),
                                            fontSize: 16,
                                            fontFamily: "AxiformaBold"
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Access all of Lura’s features plus malware and anti-virus protection.",
                                        style: TextStyle(
                                            color: Color(0xff222823),
                                            fontSize: 14
                                        ),
                                      ),
                                      Text(
                                        "N7.99/month",
                                        style: TextStyle(
                                            color: Color(0xff222823),
                                            fontSize: 14,
                                            fontFamily: "AxiformaBold"
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Checkbox(
                                    value: false,
                                    activeColor: const Color(0xff09B47C),
                                    onChanged: (value){},

                                  ),
                                )
                              ],
                            )
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Color(0xff4098F4),
                              Color(0xffA38CEE).withOpacity(0.1),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter
                        )
                        ,
                        borderRadius: BorderRadius.circular(17)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        width: Get.width,
                        padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                        decoration: BoxDecoration(color: Colors.white,
                            borderRadius: BorderRadius.circular(16)
                        ),
                        child: Center(
                            child: Row(
                              children: [
                                const Expanded(
                                  flex: 9,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Yearly Subscription",
                                        style: TextStyle(
                                            color: Color(0xff222823),
                                            fontSize: 16,
                                            fontFamily: "AxiformaBold"
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Access all of Lura’s features plus malware and anti-virus protection.",
                                        style: TextStyle(
                                            color: Color(0xff222823),
                                            fontSize: 14
                                        ),
                                      ),
                                      Text(
                                        "N59.99/month",
                                        style: TextStyle(
                                            color: Color(0xff222823),
                                            fontSize: 14,
                                            fontFamily: "AxiformaBold"
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Checkbox(
                                    value: false,
                                    activeColor: const Color(0xff09B47C),
                                    onChanged: (value){},

                                  ),
                                )
                              ],
                            )
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                NormalButton.showNormalButton((){
                  CancelAnytimeBottomSheet.showCancelAnytimeBottomSheet();
                }, "Next"),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "View Lura Features",
                  style: TextStyle(
                    color: Color(0xff222823),
                    fontSize: 14,
                    fontFamily: "AxiformaBold",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
