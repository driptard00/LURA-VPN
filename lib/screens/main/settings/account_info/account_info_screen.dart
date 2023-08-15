import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lura/Widget/disabledButton/disabledButton.dart';
import 'package:lura/Widget/normalButton/normalButton.dart';
import 'package:lura/controllers/app_state_controller.dart';
import 'package:lura/routes/app_routes/app_route_names.dart';

import '../../../../services/Theme/theme_provider.dart';

class AccountInfoScreen extends StatelessWidget {
  AccountInfoScreen({super.key});

  final AppStateController _appStateController = Get.find<AppStateController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppStateController>(
      builder: (controller) {
        return Form(
          key: _formKey,
          child: Scaffold(
            body: Container(
              height: Get.height,
              width: Get.width,
              child: Column(
                children: [
                  Container(
                    height: 170,
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: (controller.isDarkMode.value)?
                        null
                            :
                        const Color(0xffF4EFFF),
                        gradient: (!controller.isDarkMode.value)?
                        null
                            :
                        const LinearGradient(
                            colors: [
                              Color(0xff8159D4),
                              Color(0xff6300B0),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight
                        ),
                        image: DecorationImage(
                            image: AssetImage(
                              (controller.isDarkMode.value)?
                              "images/blackback.png"
                                  :
                              "images/purpleBack.png",
                            ),
                            fit: BoxFit.fill
                        )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20,),
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
                          height: 10,
                        ),
                        const Text(
                          "Account Information",
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: "AxiformaMedium"
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 50,
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
                                        controller: controller.firstNameController,
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
                                        controller: controller.lastNameController,
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
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            _listTile("Subscription Plans", Iconsax.book, Iconsax.arrow_right_34, () {
                              Get.toNamed(subscriptionPlansScreen);
                            }),
                            const Divider(
                              color: Color(0xffE2E4E2),
                            ),
                            _listTile("Card Details", Iconsax.card, Iconsax.arrow_right_34, () {
                              Get.toNamed(paymentDetailScreen);
                            }),
                            const Divider(
                              color: Color(0xffE2E4E2),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            (controller.isLoading)?
                            const Center(
                              child: SpinKitThreeBounce(
                                color: Color(0xff5D18EB),
                              ),
                            )
                            :
                            (controller.emailController.text.isNotEmpty &&
                            controller.firstNameController.text.isNotEmpty &&
                            controller.lastNameController.text.isNotEmpty)?
                            NormalButton.showNormalButton(
                                (){
                                  (_formKey.currentState!.validate())?
                                  controller.updateProfile()
                                      :
                                  AutovalidateMode.disabled;
                                }, "Update Details"
                            )
                            :
                            DisabledButton.showDisabledButton(
                              "Update Details"
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  ListTile _listTile(String title, IconData leadingIcon, IconData trailingIcon, Function() onTap) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        leadingIcon,
        size: 20,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontFamily: "AxiformaMedium"
        ),
      ),
      trailing: Icon(
        trailingIcon,
        size: 20,
      ),
    );
  }
}
