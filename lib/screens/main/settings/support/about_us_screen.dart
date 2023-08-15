import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lura/Widget/disabledButton/disabledButton.dart';
import 'package:lura/Widget/normalButton/normalButton.dart';
import 'package:lura/controllers/app_state_controller.dart';

import '../../../../services/Theme/theme_provider.dart';

class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({super.key});

  final AppStateController _appStateController = Get.find<AppStateController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            Obx(() =>
                Container(
                  height: 170,
                  width: Get.width,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: (_appStateController.isDarkMode.value)?
                      null
                          :
                      const Color(0xffF4EFFF),
                      gradient: (!_appStateController.isDarkMode.value)?
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
                            (_appStateController.isDarkMode.value)?
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
                        "About Us",
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: "AxiformaMedium"
                        ),
                      ),
                    ],
                  ),
                ),
            ),

            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      _listTile("Privacy Policy", Iconsax.book, Iconsax.arrow_right_34, () => null),
                      const Divider(
                        color: Color(0xffE2E4E2),
                      ),
                      _listTile("Terms and Conditions", Iconsax.card, Iconsax.arrow_right_34, () => null),
                      const Divider(
                        color: Color(0xffE2E4E2),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
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
            fontFamily: "Axiforma"
        ),
      ),
      trailing: Icon(
        trailingIcon,
        size: 20,
      ),
    );
  }
}
