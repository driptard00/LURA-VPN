import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lura/Widget/normalButton/normalButton.dart';
import 'package:lura/controllers/app_state_controller.dart';
import 'package:lura/routes/app_routes/app_route_names.dart';

import '../../../../../services/Theme/theme_provider.dart';

class SubscriptionPlansScreen extends StatelessWidget {
  SubscriptionPlansScreen({super.key});

  final AppStateController _appStateController = Get.find<AppStateController>();

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _appStateController.getSubscriptionPlans();
    });

    return GetBuilder<AppStateController>(
        builder: (controller) {
          return Scaffold(
            body: Container(
              height: Get.height,
              width: Get.width,
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                              decoration: BoxDecoration(
                                  color: (controller.isDarkMode.value)?
                                  Color(0xff1B1B1E)
                                      :
                                  Colors.white,
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
                                                  fontSize: 14
                                              ),
                                            ),
                                            Text(
                                              "Free",
                                              style: TextStyle(
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
                                          value: controller.isFreeChecked,
                                          activeColor: const Color(0xff09B47C),
                                          onChanged: (value){
                                            controller.updateIsFreeChecked();
                                          },

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
                      (controller.isLoading)?
                      const Text(
                        "Loading...",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      )
                          :
                      ListView.separated(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: controller.subscriptionPlans.length,
                          separatorBuilder: (context, index){
                            return const SizedBox(
                              height: 20,
                            );
                          },
                          itemBuilder: (context, index){
                            return Container(
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
                                  decoration: BoxDecoration(
                                      color: (controller.isDarkMode.value)?
                                      const Color(0xff1B1B1E)
                                          :
                                      Colors.white,
                                      borderRadius: BorderRadius.circular(16)
                                  ),
                                  child: Center(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 9,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller.subscriptionPlans[index]["plan_name"],
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: "AxiformaBold"
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  controller.subscriptionPlans[index]["description"],
                                                  style: TextStyle(
                                                      fontSize: 14
                                                  ),
                                                ),
                                                Text(
                                                  controller.subscriptionPlans[index]["price"].toString(),
                                                  style: TextStyle(
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
                                              onChanged: (value){

                                              },

                                            ),
                                          )
                                        ],
                                      )
                                  ),
                                ),
                              ),
                            );
                          }
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      NormalButton.showNormalButton((){
                        Get.toNamed(paymentDetailScreen);
                      }, "Next"),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "View Lura Features",
                        style: TextStyle(
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
    );
  }
}
