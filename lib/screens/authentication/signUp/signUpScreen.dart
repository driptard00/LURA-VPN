import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lura/Widget/onboardingButtons/button1.dart';
import 'package:lura/routes/app_routes/app_route_names.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                  "Let’s get started",
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
                  "Complete the details below to sign up",
                  style: TextStyle(
                      color: Color(0xff6E796F),
                      fontSize: 14
                  ),
                ),
                const SizedBox(
                  height: 30,
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
                                color: Color(0xff222823),
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
                                prefixIcon: Icon(
                                  Iconsax.user,
                                  size: 20,
                                  color: Color(0xff222823),
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
                                color: Color(0xff222823),
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
                              prefixIcon: Icon(
                                Iconsax.user,
                                size: 20,
                                color: Color(0xff222823),
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
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value){},
                      activeColor: Color(0xff09B47C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3)
                      ),
                    ),
                    Expanded(
                      child: const Text(
                        "I agree to the terms and conditions and privacy policy.",
                        style: TextStyle(
                            color: Color(0xff222823),
                            fontSize: 14
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                OnboardingButton1.showOnboardingButton1((){
                  Get.toNamed(signUpVerifyEmailScreen);
                }, "Sign up", Iconsax.cloud_lightning4),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: const Text(
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
                      "Already have an account?",
                      style: TextStyle(
                          color: Color(0xff222823),
                          fontSize: 14,
                      ),
                    ),
                    TextButton(
                      onPressed: (){
                        Get.toNamed(loginScreen);
                      },
                      child: Text(
                        "Sign In",
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
