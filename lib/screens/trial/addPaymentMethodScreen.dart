import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lura/Widget/normalButton/normalButton.dart';
import 'package:lura/controllers/app_state_controller.dart';

class AddPaymentMethodScreen extends StatelessWidget {
   AddPaymentMethodScreen({super.key});

   final AppStateController _appStateController = Get.put(AppStateController());
   final subID = Get.arguments["subID"];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppStateController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: InkWell(
              onTap: (){
                Get.back();
              },
              child: const Icon(
                Iconsax.arrow_left,
                size: 24,
              ),
            ),
            centerTitle: true,
            title: const Text(
              "Payment",
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: "AxiformaMedium"
              ),
            ),
          ),
          body: Container(
            height: Get.height,
            width: Get.width,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 51,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: (controller.isDarkMode.value)?
                    Color(0xff303030)
                    :
                    Colors.white,
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: (){
                          controller.updateSelectedMethod("GPAY");
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                              border: (controller.selectedMethod == "GPAY")?
                              Border.all(
                                  color: Color(0xffA38CEE),
                                  width: 2
                              )
                                  :
                              null
                          ),
                          child: Image.asset(
                            "images/gpay.png"
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.updateSelectedMethod("PAYPAL");
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: (controller.selectedMethod == "PAYPAL")?
                              Border.all(
                                  color: Color(0xffA38CEE),
                                  width: 2
                              )
                              :
                              null
                          ),
                          child: Image.asset(
                              "images/paypal.png"
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          controller.updateSelectedMethod("STRIPE");
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: (controller.selectedMethod == "STRIPE")?
                              Border.all(
                                  color: Color(0xffA38CEE),
                                  width: 2
                              )
                                  :
                              null
                          ),
                          child: Image.asset(
                              "images/stripe.png"
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Material(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Container(
                    height: 152,
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: (controller.isDarkMode.value)?
                      Color(0xff262833)
                      :
                      Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: (controller.isDarkMode.value)?
                      Border.all(
                        color: const Color(0xffA38CEE),
                        width: 1
                      )
                      :
                      null
                    ),
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Selected Plan",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Expanded(
                              child:  Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  (subID == 1)?
                                  "Monthly Subscription"
                                  :
                                  "Yearly Subscription",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),

                              ),
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Discount",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Expanded(
                              child:  Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "0.00",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Total",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "AxiformaBold"
                                ),
                              ),
                            ),
                            Expanded(
                              child:  Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  (subID == 1)?
                                  "7.99"
                                      :
                                  "59.99",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          NormalButton.showNormalButton(
                            (){
                              (controller.selectedMethod == "STRIPE")?
                              controller.createPaymentIntent(
                                  (subID == 1)?
                                  1
                                  :
                                  2
                              )
                              :
                              null;
                            },
                          "Next"
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "By continuing, you agree to the Terms and Conditions & Privacy and Policy applicable to Lura VPN.",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    ),
                  )

                )
              ],
            ),
          ),
        );
      }
    );
  }
}
