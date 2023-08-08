import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lura/Widget/normalButton/normalButton.dart';
import 'package:lura/Widget/onboardingButtons/button1.dart';
import 'package:lura/routes/app_routes/app_route_names.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  "Welcome Back, [First Name]",
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
                  "Please fill in your account details.",
                  style: TextStyle(
                      color: Color(0xff6E796F),
                      fontSize: 14
                  ),
                ),
                const SizedBox(
                  height: 30,
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
                  height: 20,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: (){
                        Get.toNamed(forgotPasswordScreen);
                      },
                      child: const Text(
                        "Forgot password?",
                        style: TextStyle(
                          color: Color(0xff222823),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 11,
                      child: NormalButton.showNormalButton((){
                        Get.toNamed(homeMainScreen);
                      }, "Sign In"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 50,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: const Color(0xff1B1B1E),
                          borderRadius: BorderRadius.circular(16)
                        ),
                        child: Image.asset(
                          "images/facial.png"
                        )
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "or",
                    style: TextStyle(
                        color: Color(0xff222823),
                        fontSize: 16,
                        fontFamily: "AxiformaMedium"
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: 96,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              color: Color(0xffE2E4E2)
                          )
                      ),
                      child: Image.asset("images/google.png"),
                    ),
                    Container(
                      height: 50,
                      width: 96,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              color: Color(0xffE2E4E2)
                          )
                      ),
                      child: Image.asset("images/facebook.png"),
                    ),
                    Container(
                      height: 50,
                      width: 96,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              color: Color(0xffE2E4E2)
                          )
                      ),
                      child: Image.asset("images/apple.png"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Are you new to Lura?",
                      style: TextStyle(
                        color: Color(0xff222823),
                        fontSize: 14,
                      ),
                    ),
                    TextButton(
                      onPressed: (){
                        Get.toNamed(signUpScreen);
                      },
                      child: const Text(
                        " Sign up",
                        style: TextStyle(
                          color: Color(0xff5D18EB),
                          fontSize: 14,
                          fontFamily: "AxiformaBold",

                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
