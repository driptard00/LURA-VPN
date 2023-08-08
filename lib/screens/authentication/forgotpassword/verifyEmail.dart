import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lura/Widget/normalButton/normalButton.dart';
import 'package:lura/Widget/onboardingButtons/button1.dart';
import 'package:lura/routes/app_routes/app_route_names.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgotPasswordVerifyEmailScreen extends StatelessWidget {
  const ForgotPasswordVerifyEmailScreen({super.key});

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
                  "Enter Verification Code",
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
                  "Enter the four-digit code sent to your email.",
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
                PinCodeTextField(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  appContext: context,
                  length: 4,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      inactiveColor: const Color(0xffCFCFCF),
                      fieldHeight: 64,
                      fieldWidth: 64,
                      selectedFillColor: const Color(0xffBD67F2),
                      selectedColor: const Color(0xffBD67F2),
                      activeColor: const Color(0xffBD67F2)
                  ),
                  // validator: (value) {
                  //   if(value == "") {
                  //     return "Please fill out field";
                  //   } else{
                  //     return null;
                  //   }
                  // },
                  onChanged: (value) {
                    // controller.updateOtp(value);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Didn’t receive OTP?",
                      style: TextStyle(
                        color: Color(0xff222823),
                        fontSize: 14,
                      ),
                    ),
                    TextButton(
                      onPressed: (){
                        Get.toNamed(loginScreen);
                      },
                      child: const Text(
                        " Resend OTP in 02:00",
                        style: TextStyle(
                          color: Color(0xff5D18EB),
                          fontSize: 14,
                          fontFamily: "AxiformaBold",

                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                NormalButton.showNormalButton((){
                  Get.toNamed(createNewPasswordScreen);
                }, "Proceed"),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
