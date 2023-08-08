import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lura/Widget/normalButton/normalButton.dart';
import 'package:lura/Widget/onboardingButtons/button1.dart';
import 'package:lura/routes/app_routes/app_route_names.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: const Icon(
                    Iconsax.arrow_left,
                    color: Color(0xff222823),
                    size: 24,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Create Your New Password",
                  style: TextStyle(
                      color: Color(0xff5D18EB),
                      fontSize: 20,
                      fontFamily: "AxiformaBold"
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Password",
                      style: TextStyle(
                          color: Color(0xff222823),
                          fontSize: 14,
                          fontFamily: "AxiformaMedium"
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
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
                          color: Color(0xff222823),
                        ),
                        suffixIcon: const Icon(
                          Iconsax.eye,
                          size: 20,
                          color: Color(0xff222823),
                        ),
                      ),
                      obscureText: true,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Verify Password",
                      style: TextStyle(
                          color: Color(0xff222823),
                          fontSize: 14,
                          fontFamily: "AxiformaMedium"
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
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
                          color: Color(0xff222823),
                        ),
                        suffixIcon: const Icon(
                          Iconsax.eye,
                          size: 20,
                          color: Color(0xff222823),
                        ),
                      ),
                      obscureText: true,
                    )
                  ],
                ),
                const SizedBox(
                  height: 150,
                ),
                NormalButton.showNormalButton((){
                  Get.toNamed(loginScreen);
                }, "Submit"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
