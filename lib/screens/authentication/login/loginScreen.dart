import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lura/Widget/normalButton/normalButton.dart';
import 'package:lura/Widget/onboardingButtons/button1.dart';
import 'package:lura/controllers/app_state_controller.dart';
import 'package:lura/routes/app_routes/app_route_names.dart';
import 'package:lura/storage/local_storage.dart';

import '../../../controllers/auth_state_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final AuthStateController _authStateController = Get.put(AuthStateController());
  final AppStateController _appStateController = Get.find<AppStateController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((timeStamp)  {
      _authStateController.getFirstName();
      _authStateController.updateEmailController();
    });

    return GetBuilder<AuthStateController>(
      builder: (controller) {
        return Form(
          key: _formKey,
          child: Scaffold(
            body: Container(
              height: Get.height,
              width: Get.width,
              padding: EdgeInsets.symmetric(horizontal: 20),
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
                          size: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Welcome Back, ${controller.firstName}",
                        style: const TextStyle(
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
                            // color: Color(0xff6E796F),
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
                                fontSize: 14,
                                fontFamily: "AxiformaMedium"
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: controller.emailController,
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
                                prefixIcon: const Icon(
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
                      Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: (){
                              Get.toNamed(forgotPasswordScreen);
                            },
                            child: Text(
                              "Forgot password?",
                              style: TextStyle(
                                fontSize: 12,
                                  color: (_appStateController.isDarkMode.value)?
                                  Colors.white
                                  :
                                  const Color(0xff222823)
                              ),
                            ),
                          ),
                        ],
                      ),
                      ),

                      const SizedBox(
                        height: 70,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 11,
                            child: (controller.isLoading)?
                            const Center(
                              child: SpinKitThreeBounce(
                                color: Color(0xff5D18EB),
                              ),
                            )
                            :
                            NormalButton.showNormalButton((){
                              (_formKey.currentState!.validate())?
                              controller.login()
                              :
                              AutovalidateMode.disabled;
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
                                color: (_appStateController.isDarkMode.value)?
                                const Color(0xff9365F2)
                                :
                                const Color(0xff1B1B1E),
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
          ),
        );
      }
    );
  }
}
