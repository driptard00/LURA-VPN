import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lura/Widget/normalButton/normalButton.dart';

import '../../../../../controllers/app_state_controller.dart';
import '../../../../../services/Theme/theme_provider.dart';

class AddCardScreen extends StatelessWidget {
  AddCardScreen({super.key});

  final AppStateController _appStateController = Get.find<AppStateController>();

  @override
  Widget build(BuildContext context) {
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
          "Add Card",
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "First Name",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "AxiformaMedium"
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: Color(0xffA7AEA8),
                                          width: 1
                                      )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: Color(0xffC880F4),
                                          width: 1
                                      )
                                  ),
                                  prefixIcon: const Icon(
                                    Iconsax.user,
                                    size: 20,
                                  )
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Last Name",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "AxiformaMedium"
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: Color(0xffA7AEA8),
                                          width: 1
                                      )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: Color(0xffC880F4),
                                          width: 1
                                      )
                                  ),
                                  prefixIcon: const Icon(
                                    Iconsax.user,
                                    size: 20,
                                  )
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Card Number",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: "AxiformaMedium"
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: Color(0xffA7AEA8),
                                    width: 1
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: Color(0xffC880F4),
                                    width: 1
                                )
                            ),
                            prefixIcon: Image.asset(
                              "images/mastercard.png"
                            )
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Expiration Date",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "AxiformaMedium"
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: Color(0xffA7AEA8),
                                          width: 1
                                      )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: Color(0xffC880F4),
                                          width: 1
                                      )
                                  ),
                                  prefixIcon: const Icon(
                                    Iconsax.calendar,
                                    size: 20,
                                  )
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "CVV",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "AxiformaMedium"
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: Color(0xffA7AEA8),
                                          width: 1
                                      )
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: Color(0xffC880F4),
                                          width: 1
                                      )
                                  ),
                                  prefixIcon: const Icon(
                                    Iconsax.lock,
                                    size: 20,
                                  )
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 200,
              ),
              Column(
                children: [
                  NormalButton.showNormalButton((){}, "Add Card"),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "By continuing, you agree to the Terms and Conditions & Privacy and Policy applicable to Lura VPN.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              )
          ],
          ),
        ),
      ),
    );
  }
}
