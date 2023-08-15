import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lura/Widget/onboardingButtons/button1.dart';
import 'package:lura/controllers/auth_state_controller.dart';
import 'package:lura/routes/app_routes/app_route_names.dart';

import '../../../controllers/app_state_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final AuthStateController _authStateController = Get.put(AuthStateController());
  final AppStateController _appStateController = Get.find<AppStateController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthStateController>(
      builder: (controller) {
        return Scaffold(
          body: Container(
            height: Get.height,
            width: Get.width,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
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
                                  validator: ValidationBuilder().build(),
                                  onChanged: (value){
                                    controller.updateFirstName(value);
                                  },
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
                                  validator: ValidationBuilder().build(),
                                  onChanged: (value){
                                    controller.updateLastName(value);
                                  },
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
                                )
                            ),
                            validator: ValidationBuilder().email().build(),
                            onChanged: (value){
                              controller.updateEmail(value);
                            },
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
                                ),
                              suffixIcon: InkWell(
                                onTap: (){
                                  controller.updateHidePassword();
                                },
                                child: (controller.hidePassword)?
                                const Icon(
                                  Iconsax.eye_slash,
                                  size: 20,
                                )
                                :
                                const Icon(
                                  Iconsax.eye,
                                  size: 20,
                                ),
                              ),
                            ),
                            obscureText: controller.hidePassword,
                            validator: ValidationBuilder().build(),
                            onChanged: (value){
                              controller.updatePassword(value);
                            },
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: controller.isChecked,
                            onChanged: (value){
                              controller.updateIsChecked();
                            },
                            activeColor: Color(0xff09B47C),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3)
                            ),
                          ),
                          const Expanded(
                            child:  Text(
                              "I agree to the terms and conditions and privacy policy.",
                              style: TextStyle(
                                  fontSize: 14
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      (controller.isLoading)?
                      Center(
                        child: const SpinKitThreeBounce(
                          color: Color(0xff5D18EB),
                        ),
                      )
                          :
                      OnboardingButton1.showOnboardingButton1((){
                        (_formKey.currentState!.validate() && controller.isChecked)?
                        controller.registerUser()
                        :
                        Get.snackbar(
                            "Alert",
                            "Please fill all required fields",
                          colorText: Colors.white,
                          backgroundColor: Colors.red
                        );
                        AutovalidateMode.disabled;
                      }, "Sign up", Icons.electric_bolt_outlined),
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "or",
                          style: TextStyle(
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
          ),
        );
      }
    );
  }
}
