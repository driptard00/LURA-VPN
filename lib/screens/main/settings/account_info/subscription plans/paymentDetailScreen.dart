import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lura/Widget/disabledButton/disabledButton.dart';
import 'package:lura/Widget/normalButton/normalButton.dart';
import 'package:lura/controllers/app_state_controller.dart';
import 'package:lura/routes/app_routes/app_route_names.dart';

import '../../../../../services/Theme/theme_provider.dart';

class PaymentDetailScreen extends StatelessWidget {
  PaymentDetailScreen({super.key});

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
                            "Card Details",
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
                    height: Get.height,
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          ListView.separated(
                            padding: EdgeInsets.zero,
                            primary: false,
                              shrinkWrap: true,
                              itemBuilder: (context, index){
                                return ListTile(
                                  title: Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          controller.cards[index]["image"],
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          controller.cards[index]["type"],
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontFamily: "AxiformaMedium"
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  subtitle: Text(
                                    "${controller.cards[index]["cardNumber"]} | ${controller.cards[index]["exp.Date"]}",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: "AxiformaMedium"
                                    ),
                                  ),
                                  trailing: const Icon(
                                    Icons.more_vert_outlined,
                                    size: 24,
                                  ),
                                );
                              },
                              separatorBuilder: (context, index){
                                return const Divider(
                                  color: Color(0xffE2E4E2),
                                );
                              },
                              itemCount: controller.cards.length
                          ),
                          const Divider(
                            color: Color(0xffE2E4E2),
                          ),
                          ListTile(
                            leading: Icon(
                              Iconsax.card,
                              size: 24,
                            ),
                            title: Text(
                              "•••• •34 | MM/YY",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "AxiformaMedium"
                              ),
                            ),
                            trailing: InkWell(
                              onTap: (){
                                Get.toNamed(addCardScreen);
                              },
                              child: Text(
                                "Add Card",
                                style: TextStyle(
                                    color: Color(0xff5D18EB),
                                    fontSize: 14,
                                    fontFamily: "AxiformaMedium"
                                ),
                              ),
                            ),
                            horizontalTitleGap: 2,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            "Subscription History",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "AxiformaBold"
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ListView.separated(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              itemBuilder: (context, index){
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "11/03/2023",
                                          style: TextStyle(
                                              color: Color(0xff5D18EB),
                                              fontSize: 14,
                                              fontFamily: "AxiformaMedium"
                                          ),
                                        ),
                                        const Text(
                                          "N10,000",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "AxiformaMedium"
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      "Billing Period : 28/10/2022 -28/11/2022",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "AxiformaMedium"
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          "images/mastercardCircle.png",
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
                                          "•••• •••• •••• 3138",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "AxiformaMedium"
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder: (context, index){
                                return const Divider(
                                  color: Color(0xffE2E4E2),
                                );
                              },
                              itemCount: 5
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
    );
  }
}
