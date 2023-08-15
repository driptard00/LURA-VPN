import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lura/Widget/bottomSheets/connection_logs_detail.dart';
import 'package:lura/controllers/app_state_controller.dart';
import 'package:lura/services/Theme/theme_provider.dart';

class ConnectionLogScreen extends StatelessWidget {
   ConnectionLogScreen({super.key});

  final AppStateController _appStateController = Get.find<AppStateController>();

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _appStateController.getConnectionLogs();
    });

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
                        "Connection Log",
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: "AxiformaMedium"
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: (controller.isLoading)?
                  const Center(
                    child: SpinKitThreeBounce(
                      color: Color(0xff5D18EB),
                    ),
                  )
                  :
                  (controller.connectionLogs.isEmpty)?
                  const Center(
                    child: Text(
                      "No logs available",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "AxiformaMedium"
                      ),
                    ),
                  )
                  :
                  Container(
                    height: Get.height,
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GroupedListView<dynamic, String>(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      elements: controller.connectionLogs,
                      groupBy: (element) => element['month'],
                      groupSeparatorBuilder: (String groupByValue) => Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 15
                        ),
                        child:  Text(
                          groupByValue,
                          style: const TextStyle(
                              fontSize: 24,
                              fontFamily: "AxiformaMedium"
                          ),
                        ),
                      ),
                      itemBuilder: (context, dynamic element){
                        return _listTile(
                          element["logs"]["location"],
                          element["logs"]["date"],
                          () {
                            ConnectionLogBottomSheet.showConnectionLogBottomSheet(element);
                          }
                        );
                      },
                      order: GroupedListOrder.ASC, // optional
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

   ListTile _listTile(String title, subtitle, Function() onTap) {
     return ListTile(
       onTap: onTap,
       title: Text(
         title,
         style: const TextStyle(
           fontSize: 14,
             fontFamily: "AximformaMedium"
         ),
       ),
       subtitle: Text(
         "Location: $subtitle",
         style: const TextStyle(
           fontSize: 14,
           fontFamily: "Aximforma"
         ),
       ),
       trailing: const Icon(
         Icons.info_outline,
         color:  Color(0xffBD67F2),
         size: 20,
       ),
     );
   }
}
