import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../controllers/app_state_controller.dart';
import '../../../routes/app_routes/app_route_names.dart';

class SubcribeAdScreen extends StatelessWidget {
  SubcribeAdScreen({super.key});

  final AppStateController _appStateController = Get.put(AppStateController());


  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _appStateController.getProfile();
    });

    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xff1D64ED),
                Color(0xff42169E),
              ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: const Icon(
                        Iconsax.arrow_left,
                        size: 24,
                        color: Colors.white
                      ),
                    ),
                    Image.asset(
                      "images/LURa.png",
                      height: 16,
                      width: 92,
                      color: Colors.white
                    ),
                    InkWell(
                      onTap: (){
                        Get.toNamed(settingScreen);
                      },
                      child: const Icon(
                        Iconsax.setting_2,
                        size: 24,
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "images/subscribe_ad.png"
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Upgrade to LuraPro",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "AxiformaBold",
                    fontSize: 32
                  ),
                ),
                const Text(
                  "3, 2, 1 blast off! Explore the world-wide-web like never before with LuraPro.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: (){
                    Get.toNamed(subscriptionPlansScreen);
                  },
                  child: Container(
                    height: 50,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: const Center(
                      child: Text(
                        "Get LuraPro",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "7.99/month",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "View Lura Features",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontFamily: "AxiformaBold",
                      decoration: TextDecoration.underline
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
