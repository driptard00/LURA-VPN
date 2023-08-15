import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lura/Widget/normalButton/normalButton.dart';
import 'package:lura/Widget/onboardingButtons/button1.dart';
import 'package:lura/controllers/auth_state_controller.dart';
import 'package:lura/routes/app_routes/app_route_names.dart';

import '../../../controllers/app_state_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
   ForgotPasswordScreen({super.key});

  final AppStateController _appStateController = Get.find<AppStateController>();
  final AuthStateController _authStateController = Get.find<AuthStateController>();
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
              child: Form(
                key: _formKey,
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
                        height: 150,
                      ),
                      (controller.isLoading)?
                      const Center(
                        child: SpinKitThreeBounce(
                          color: Color(0xff5D18EB),
                        ),
                      )
                      :
                      NormalButton.showNormalButton((){
                        (_formKey.currentState!.validate())?
                        controller.resendPasswordEmailCode()
                        :
                        AutovalidateMode.disabled;
                      }, "Reset Password"),
                      const SizedBox(
                        height: 20,
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
