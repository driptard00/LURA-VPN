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

class CreateNewPasswordScreen extends StatelessWidget {
  CreateNewPasswordScreen({super.key});

  final AuthStateController _authStateController = Get.find<AuthStateController>();
  final AppStateController _appStateController = Get.find<AppStateController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Verify Password",
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
                                  controller.updateHideConfirmPassword();
                                },
                                child: (controller.hideConfirmPassword)?
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
                            obscureText: controller.hideConfirmPassword,
                            validator: ValidationBuilder().build(),
                            onChanged: (value){
                              controller.updatePasswordConfirm(value);
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
                        controller.resetPassword()
                            :
                        AutovalidateMode.disabled;
                      }, "Submit"),
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
