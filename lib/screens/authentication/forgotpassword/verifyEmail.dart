import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lura/Widget/normalButton/normalButton.dart';
import 'package:lura/Widget/onboardingButtons/button1.dart';
import 'package:lura/controllers/auth_state_controller.dart';
import 'package:lura/routes/app_routes/app_route_names.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../controllers/app_state_controller.dart';

class ForgotPasswordVerifyEmailScreen extends StatelessWidget {
   ForgotPasswordVerifyEmailScreen({super.key});

  final AppStateController _appStateController = Get.find<AppStateController>();
  final AuthStateController _authStateController = Get.find<AuthStateController>();
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _authStateController.startTimer();
    });

    return GetBuilder<AuthStateController>(
      builder: (controller) {
        return Scaffold(
          body: Form(
            key: _formKey,
            child: Container(
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
                        validator: ValidationBuilder().build(),
                        onChanged: (value) {
                          controller.updateOtpCode(value);
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
                              fontSize: 14,
                            ),
                          ),
                          TextButton(
                            onPressed: (){
                              Get.toNamed(loginScreen);
                            },
                            child: Text(
                              " Resend OTP in ${controller.remainingSeconds.toString()}",
                              style: const TextStyle(
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
                      (controller.isLoading)?
                      const Center(
                        child:  SpinKitThreeBounce(
                          color: Color(0xff5D18EB),
                        ),
                      )
                          :
                      NormalButton.showNormalButton((){
                        (_formKey.currentState!.validate())?
                            Get.toNamed(createNewPasswordScreen)
                        :
                        AutovalidateMode.disabled;
                      }, "Proceed"),
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
