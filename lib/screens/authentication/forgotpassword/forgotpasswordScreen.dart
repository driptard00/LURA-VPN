import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lura/Widget/normalButton/normalButton.dart';
import 'package:lura/Widget/onboardingButtons/button1.dart';
import 'package:lura/routes/app_routes/app_route_names.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: const Color(0xffF9F9F9),
        child: SafeArea(
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
                "Forgot Password?",
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
                "No worries! We’ll send you instructions to reset your password.",
                style: TextStyle(
                    color: Color(0xff6E796F),
                    fontSize: 14
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                    "images/sheildVer.png"
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Email Address",
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
                    keyboardType: TextInputType.emailAddress,
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
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          size: 20,
                          color: Color(0xff222823),
                        )
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 150,
              ),
              NormalButton.showNormalButton((){
                Get.toNamed(forgotPasswordVerifyEmailScreen);
              }, "Reset Password"),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
