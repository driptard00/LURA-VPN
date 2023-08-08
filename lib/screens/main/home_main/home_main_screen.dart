import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lura/routes/app_routes/app_route_names.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({super.key});

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){},
                        child: const Icon(
                          Iconsax.user,
                          color: Color(0xff222823),
                          size: 24,
                        ),
                      ),
                      Image.asset(
                        "images/LURa.png",
                        height: 16,
                        width: 92,
                        color: Colors.black,
                      ),
                      InkWell(
                        onTap: (){
                          Get.toNamed(settingScreen);
                        },
                        child: const Icon(
                          Iconsax.setting_2,
                          color: Color(0xff222823),
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
