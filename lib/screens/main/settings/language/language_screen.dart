import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lura/controllers/app_state_controller.dart';

import '../../../../services/Theme/theme_provider.dart';

class LanguageScreen extends StatelessWidget {
   LanguageScreen({super.key});

  final AppStateController _appStateController = Get.put(AppStateController());


   @override
  Widget build(BuildContext context) {
    return GetBuilder<AppStateController>(
      builder: (controller) {
        return Scaffold(
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
                            "Language",
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
                    child: ListView.separated(
                        primary: false,
                        itemBuilder: (context, index){
                          return RadioListTile(
                              title: Text(
                                controller.languages[index],
                                style: const TextStyle(
                                    fontSize: 14,
                                  fontFamily: "Axiforma"
                                ),
                              ),
                              controlAffinity: ListTileControlAffinity.trailing,
                              activeColor: const Color(0xff5D18EB),
                              value: controller.languages[index],
                              groupValue: controller.selectedLanguage,
                              onChanged: (value){
                                controller.updateSelectedLanguage(value);
                              }
                          );
                        },
                        separatorBuilder: (context, index){
                          return const Divider(
                            color: Color(0xffE2E4E2),
                          );
                        },
                        itemCount: controller.languages.length
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
