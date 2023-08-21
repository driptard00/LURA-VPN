import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:lura/controllers/app_state_controller.dart';
import 'package:lura/routes/app_routes/app_route_names.dart';

import '../../../../services/Theme/theme_provider.dart';

class ConnectionSettingScreen extends StatelessWidget {
  ConnectionSettingScreen({super.key});

  final AppStateController _appStateController = Get.find<AppStateController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppStateController>(
      builder: (controller) {
        return Scaffold(
          body: LoadingOverlay(
            isLoading: controller.isLoading,
            child: Container(
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
                          "Connection Settings",
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
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            _listTile2(
                              "Malware Protection",
                              CupertinoSwitch(
                                value: controller.isMalwareProtected,
                                onChanged: (value){
                                  controller.toggleIsMalwareProtected();
                                },
                                activeColor: const Color(0xffBD67F2),
                              ),
                                  (){},
                            "Block potentially harmful sites known to house viruses and malware."

                            ),
                            const Divider(
                              color: Color(0xffE2E4E2),
                            ),
                            _listTile2(
                              "Phishing Protection",
                              CupertinoSwitch(
                                value: controller.isPhishingProtected,
                                onChanged: (value){
                                  controller.toggleIsPhishingProtected();
                                },
                                activeColor: const Color(0xffBD67F2),
                              ),
                                  (){},
                              "Protect your data from cyber attacks sent via email."
                            ),
                            const Divider(
                              color: Color(0xffE2E4E2),
                            ),
                            _listTile2(
                              "Data breach scanner",
                              CupertinoSwitch(
                                value: controller.onDatabreachScanner,
                                onChanged: (value){
                                  controller.toggleOnDataBreachScanner();
                                },
                                activeColor: const Color(0xffBD67F2),
                              ),
                                  (){},
                              "Automatically scan for leaked data and potential threats."
                            ),
                            const Divider(
                              color: Color(0xffE2E4E2),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            _listTile(
                                const Padding(
                                  padding:  EdgeInsets.only(bottom: 10),
                                  child:  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Kill Switch",
                                        style:  TextStyle(
                                          fontSize: 14,
                                          fontFamily: "AxiformaMedium"
                                        ),
                                      ),
                                      Text(
                                        "Device Settings",
                                        style:  TextStyle(
                                          color: Color(0xffBD67F2),
                                          fontSize: 14,
                                          fontFamily: "AxiformaBold"
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                "Enable ‘always on’ and block connections with VPN automatically."
                            )
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

  ListTile _listTile2(String title, CupertinoSwitch trailingIcon, Function() onTap, String subtitle) {
    return ListTile(
        onTap: onTap,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: "AxiformaMedium"
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
        trailing: trailingIcon
    );
  }

  ListTile _listTile(Widget title, String subtitle) {
    return ListTile(
        title: title,
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
    );
  }
}
