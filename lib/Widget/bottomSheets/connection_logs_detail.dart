import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lura/Widget/normalButton/normalButton.dart';
import 'package:lura/controllers/app_state_controller.dart';
import 'package:lura/services/Theme/theme_provider.dart';

final AppStateController _appStateController = Get.find<AppStateController>();

class ConnectionLogBottomSheet {
  static showConnectionLogBottomSheet (element) {
    Get.bottomSheet(
    Obx(() =>
        Container(
          height: 400,
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: (!_appStateController.isDarkMode.value)?
              Colors.white
                  :
              const Color(0xff1A1919),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
              )
          ),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Container(
                    height: 5,
                    width: 64,
                    decoration: BoxDecoration(
                        color: const Color(0xff757575),
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Date:",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "AxiformaMedium"
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          element["logs"]["Date"],
                          style: const TextStyle(
                              fontSize: 14,
                              fontFamily: "AxiformaMedium"
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Location:",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "AxiformaMedium"
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          element["logs"]["location"],
                          style: const TextStyle(
                              fontSize: 14,
                              fontFamily: "AxiformaMedium"
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Duration:",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "AxiformaMedium"
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "AxiformaMedium"
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "IP:",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "AxiformaMedium"
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          element["logs"]["ip"],
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "AxiformaMedium"
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Download speed:",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "AxiformaMedium"
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "AxiformaMedium"
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Upload Speed:",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "AxiformaMedium"
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "AxiformaMedium"
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Center(
                    child: NormalButton.showNormalButton(
                            (){},
                        "Connect"
                    ),
                  )
              )
            ],
          ),
        )
    )
    );
  }
}