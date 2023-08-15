import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lura/Widget/normalButton/normalButton.dart';
import 'package:lura/routes/app_routes/app_route_names.dart';
import 'package:lura/services/Theme/theme_provider.dart';

import '../../../controllers/app_state_controller.dart';

class HomeMainScreen extends StatefulWidget {
  HomeMainScreen({super.key});


  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {

  final AppStateController _appStateController = Get.put(AppStateController());


  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _appStateController.fetchMyLocation();
      // _appStateController.getPortList();
      _appStateController.getServerList();
      _appStateController.getProfile();
    });

    return GetBuilder<AppStateController>(
      builder: (controller) {
        return Scaffold(
          body: (controller.isLoading)?
          const Center(
            child: SpinKitThreeBounce(
              color: Color(0xff5D18EB),
            ),
          )
          :
          Stack(
            children: [
              Container(
                height: Get.height,
                width: Get.width,
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 300,
                child: Image.asset(
                  (controller.isDarkMode.value)?
                  "images/world map.png"
                  :
                  "images/world map white.png",
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Image.asset(
                  "images/world_bottom.png",
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 40,
                child: Image.asset(
                  "images/leftEclipse.png",
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                child: Image.asset(
                  "images/rightEclipse.png",
                  fit: BoxFit.fill,
                ),
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
                            onTap: (){
                              Get.toNamed(accountInfoScreen);
                            },
                            child: const Icon(
                              Iconsax.user,
                              size: 24,
                            ),
                          ),
                          Image.asset(
                            "images/LURa.png",
                            height: 16,
                            width: 92,
                            color: (controller.isDarkMode.value)?
                            Colors.white
                            :
                            Colors.black,
                          ),
                          InkWell(
                            onTap: (){
                              Get.toNamed(settingScreen);
                            },
                            child: const Icon(
                              Iconsax.setting_2,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Container(
                        height: 234,
                        width: 234,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "images/outer_layer.png"
                                )
                            )
                        ),
                        child: Container(
                          height: 196,
                          width: 196,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "images/inner_layer.png",
                                ),
                              )
                          ),
                          child: Center(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "images/purpleButton.png"
                                  ),
                                )
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "Recommended Server",
                        style: TextStyle(
                            fontSize: 12,
                        ),
                      ),
                      Text(
                        controller.myLocation["country"],
                        style: const TextStyle(
                            fontSize: 32,
                            fontFamily: "AxiformaBold"
                        ),
                      ),
                      Text(
                        controller.myLocation["ip"],
                        style: TextStyle(
                            fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  child: DraggableScrollableSheet(
                    maxChildSize: 0.7,
                    minChildSize: 0.2,
                    initialChildSize: 0.2,
                    builder: (_, dragController)=> Container(
                      decoration:  BoxDecoration(
                        color: (controller.isDarkMode.value)?
                        Color(0xff262833)
                        :
                        Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(48),
                          topRight: Radius.circular(48)
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
                            flex: 9,
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              controller: dragController,
                              itemCount: 1,
                              itemBuilder: (context, index){
                                return Accordion(
                                  disableScrolling: true,
                                  children: controller.vpns.map((vpn) {
                                    return AccordionSection(
                                      rightIcon: const Icon(Iconsax.arrow_down_1, color: Color(0xffCFCFCF)),
                                      headerBackgroundColor: (controller.isDarkMode.value)?
                                      const Color(0xff262833)
                                          :
                                      Colors.white,
                                      headerBackgroundColorOpened: (controller.isDarkMode.value)?
                                      Color(0xff262833)
                                          :
                                      Colors.white,
                                      leftIcon: Container(
                                        height: 49,
                                        width: 49,
                                        decoration: const BoxDecoration(
                                            color: Color(0xff1B1B1E),
                                            shape: BoxShape.circle
                                        ),
                                        child: Container(
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      vpn["icon"]
                                                  )
                                              )
                                          ),
                                        ),
                                      ),
                                      header: Text(
                                        "${vpn["city"]}, ${vpn["country_code"]}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: "AxiformaMedium"
                                        ),
                                      ),
                                      content: RadioListTile(
                                          controlAffinity: ListTileControlAffinity.trailing,
                                          title: Text(
                                            vpn["ip"],
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontFamily: "AxiformaMedium"
                                            ),
                                          ),
                                          value: "value",
                                          groupValue: "groupValue",
                                          onChanged: (value){

                                          }
                                      ),
                                      contentBackgroundColor: (controller.isDarkMode.value)?
                                      Color(0xff262833)
                                          :
                                      Colors.white,
                                      contentBorderColor: (controller.isDarkMode.value)?
                                      Color(0xff262833)
                                          :
                                      Colors.white,
                                      contentBorderWidth: 0,
                                    );
                                  }).toList()
                                );
                              }
                            )
                          ),
                        ],
                      ),
                    )
                )
              )
            ],
          ),
        );
      }
    );
  }

}

// GroupedListView<dynamic, String>(
// controller: dragController,
// elements: controller.vpns,
// primary: false,
// groupBy: (element) => element['type'],
// groupSeparatorBuilder: (String groupByValue) {
// return Padding(
// padding: const EdgeInsets.symmetric(horizontal: 15),
// child: Text(
// groupByValue,
// style: const TextStyle(
// fontSize: 16,
// fontFamily: "AxiformaMedium"
// ),
// ),
// );
// },
// itemBuilder: (context,  element) => Accordion(
// disableScrolling: true,
// children: List.generate(
// element.length,
// (index) =>  AccordionSection(
// rightIcon: const Icon(Iconsax.arrow_down_1, color: Color(0xffCFCFCF)),
// headerBackgroundColor: (controller.isDarkMode.value)?
// Color(0xff262833)
//     :
// Colors.white,
// headerBackgroundColorOpened: (controller.isDarkMode.value)?
// Color(0xff262833)
//     :
// Colors.white,
// header: Row(
// children: [
// Container(
// height: 49,
// width: 49,
// decoration: const BoxDecoration(
// color: Color(0xff1B1B1E),
// shape: BoxShape.circle
// ),
// child: Container(
// height: 32,
// width: 32,
// decoration: BoxDecoration(
// image: DecorationImage(
// image: AssetImage(
// element["imageUrl"]
// )
// )
// ),
// ),
// ),
// const SizedBox(width: 10,),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// element['location'],
// style: const TextStyle(
// fontSize: 16,
// fontFamily: "AxiformaMedium"
// ),
// ),
// const SizedBox(height: 5,),
// Text(
// "${element['ipLocations'].length} IP Locations",
// style: const TextStyle(
// fontSize: 12,
// ),
// ),
// ],
// )
// ],
// ),
// content: ListView.builder(
// primary: false,
// shrinkWrap: true,
// itemCount: element["ipLocations"].length,
// itemBuilder: (context, index){
// return RadioListTile(
// controlAffinity: ListTileControlAffinity.trailing,
// title: Text(
// element['ipLocations'][index],
// style: const TextStyle(
// fontSize: 16,
// fontFamily: "AxiformaMedium"
// ),
// ),
// value: "value",
// groupValue: "groupValue",
// onChanged: (value){
// }
// );
// }
// ),
// contentBackgroundColor: (controller.isDarkMode.value)?
// Color(0xff262833)
//     :
// Colors.white,
// contentBorderColor: (controller.isDarkMode.value)?
// Color(0xff262833)
//     :
// Colors.white,
// contentBorderWidth: 0,
// ),
// growable: false
// )
//
// ),
// itemComparator: (item1, item2) => item1['location'].compareTo(item2['location']), // optionaloptional
// order: GroupedListOrder.ASC, // optional
// ),
