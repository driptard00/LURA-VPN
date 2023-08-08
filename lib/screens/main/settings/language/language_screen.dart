import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lura/controllers/app_state_controller.dart';

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
                  decoration: const BoxDecoration(
                      color: Color(0xffF4EFFF),
                      image: DecorationImage(
                          image: AssetImage(
                              "images/purpleBack.png"
                          )
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20,),
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Iconsax.arrow_left,
                          color: Color(0xff222823),
                          size: 24,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Language",
                        style: TextStyle(
                            color: Color(0xff222823),
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
                    color: Colors.white,
                    child: ListView.separated(
                        primary: false,
                        itemBuilder: (context, index){
                          return RadioListTile(
                            title: Text(
                              controller.languages[index],
                              style: const TextStyle(
                                color: Color(0xff262833),
                                fontSize: 14
                              ),
                            ),
                            controlAffinity: ListTileControlAffinity.trailing,
                            activeColor: Color(0xff5D18EB),
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
