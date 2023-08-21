import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lura/Widget/normalButton/normalButton.dart';
import 'package:lura/routes/app_routes/app_route_names.dart';
import 'package:lura/services/Theme/theme_provider.dart';
import 'package:openvpn_flutter/openvpn_flutter.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

import '../../../controllers/app_state_controller.dart';

class HomeMainScreen extends StatefulWidget {
  HomeMainScreen({super.key});


  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {

  final AppStateController _appStateController = Get.put(AppStateController());
  DraggableScrollableController _draggableScrollableController = DraggableScrollableController();
  late OpenVPN engine;
  VpnStatus? status;
  VPNStage? stage;
  bool _granted = false;

  @override
  void initState() {
    engine = OpenVPN(
      onVpnStatusChanged: (data) {
        setState(() {
          status = data;
        });
      },
      onVpnStageChanged: (data, raw) {
        setState(() {
          stage = data;
        });
      },
    );

    engine.initialize(
      groupIdentifier: "group.com.laskarmedia.vpn",
      providerBundleIdentifier:
      "id.laskarmedia.openvpnFlutterExample.VPNExtension",
      localizedDescription: "VPN by Nizwar",
      lastStage: (stage) {
        setState(() {
          this.stage = stage;
        });
      },
      lastStatus: (status) {
        setState(() {
          this.status = status;
        });
      },
    );
    super.initState();
  }

  Future<void> initPlatformState() async {
    engine.connect("", "USA",
        username: "",
        password: "",
        certIsRequired: true);
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _appStateController.fetchMyLocation();
      _appStateController.getGeoLocation();
      _appStateController.getServerList();
      _appStateController.getPortList();
      _appStateController.getProfile();
    });

    return GetBuilder<AppStateController>(
      builder: (controller) {
      return (controller.isLoading)?
         Container(
           height: Get.height,
           width: Get.width,
           color: (controller.isDarkMode.value)?
            Color(0xff1B1B1E)
           :
            Colors.white,
           child: const Center(
            child: SpinKitThreeBounce(
              color: Color(0xff5D18EB),
            ),
        ),
         )
        :
        (controller.isSubActive)?
        Scaffold(
          body: Stack(
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
                        height: 40,
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
                            child: InkWell(
                              onTap: (){
                                // initPlatformState();
                                // controller.getConfiguration(2, 1);
                                controller.toggleIsConnected();
                              },
                              child: (controller.isConnected)?
                              Image.asset(
                                  "images/redButton.png"
                              )
                              :
                              Image.asset(
                                  "images/purpleButton.png"
                              )
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      (controller.isConnected)?
                      const Text(
                        "Connected to",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      )
                      :
                      const Text(
                        "Recommended Server",
                        style: TextStyle(
                            fontSize: 12,
                        ),
                      ),
                      Text(
                        controller.myLocation["country"] == null?
                          "Loading Country..."
                        :
                        controller.myLocation["country"],
                        style: const TextStyle(
                            fontSize: 32,
                            fontFamily: "AxiformaBold"
                        ),
                      ),
                      Text(
                        controller.myLocation["ip"]== null?
                        "Loading Ip"
                            :
                        controller.myLocation["ip"],
                        style: TextStyle(
                            fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      (controller.isConnected)?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 67,
                            width: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xffAB55EF)
                              ),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: (controller.isDarkMode.value)?
                                  [
                                    Colors.white.withOpacity(0.2),
                                    Colors.black.withOpacity(0),
                                  ]
                                  :
                                  [
                                  Colors.white.withOpacity(0.4),
                                  Colors.white.withOpacity(0.6),
                                  ],
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft,
                              )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_downward,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                     Text(
                                      "Download",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color:  (controller.isDarkMode.value)?
                                        Color(0xffCDCDCD)
                                            :
                                        Color(0xff1B1B1E)
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "120",
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontFamily: "AxiformaBold"
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                         Text(
                                          "MB/S",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: (controller.isDarkMode.value)?
                                            Color(0xffCDCDCD)
                                                :
                                            Color(0xff1B1B1E)
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 67,
                            width: 150,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xffAB55EF)
                                ),
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: (controller.isDarkMode.value)?
                                  [
                                    Colors.white.withOpacity(0.2),
                                    Colors.black.withOpacity(0),
                                  ]
                                      :
                                  [
                                    Colors.white.withOpacity(0.4),
                                    Colors.white.withOpacity(0.6),
                                  ],
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft,
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_upward,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                     Text(
                                      "Upload",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: (controller.isDarkMode.value)?
                                          Color(0xffCDCDCD)
                                              :
                                          Color(0xff1B1B1E)
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "10.5",
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontFamily: "AxiformaBold"
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                         Text(
                                          "MB/S",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: (controller.isDarkMode.value)?
                                              Color(0xffCDCDCD)
                                              :
                                              Color(0xff1B1B1E)
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                      :
                      SizedBox()
                    ],
                  ),
                ),
              ),
              Positioned(
                  child: DraggableScrollableSheet(
                    controller: _draggableScrollableController,
                    maxChildSize: 0.7,
                    minChildSize: 0.2,
                    initialChildSize: 0.2,
                    builder: (context, dragController)=> Container(
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
                            child: (controller.vpns.isEmpty)?
                            const Text(
                              "Loading Servers..."
                            )
                            :
                            ListView.builder(
                              padding: EdgeInsets.only(top: 20),
                              controller: dragController,
                              itemCount: controller.vpns.length,
                              itemBuilder: (context, index){
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  child: ExpansionTileCard(
                                    baseColor: (controller.isDarkMode.value)?
                                    const Color(0xff262833)
                                    :
                                    Colors.white,
                                    expandedColor: (controller.isDarkMode.value)?
                                    Color(0xff262833)
                                        :
                                    Colors.white,
                                    expandedTextColor: (controller.isDarkMode.value)?
                                        Colors.white
                                    :
                                      Colors.black,
                                    elevation: 0,
                                    leading: Container(
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
                                              (controller.vpns[index]["icon"] == null)?
                                                ""
                                              :
                                              controller.vpns[index]["icon"]
                                            )
                                          )
                                        ),
                                      ),
                                    ),
                                    title: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            controller.vpns[index]["city"] == null || controller.vpns[index]["country_code"] == null?
                                            ""
                                            :
                                            "${controller.vpns[index]["city"]}, ${controller.vpns[index]["country_code"]}",
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontFamily: "AxiformaMedium"
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Image.asset(
                                                "images/checked.png",
                                                height: 50,
                                                width: 50,
                                              ),
                                              Image.asset(
                                                "images/speed quality.png",
                                                height: 50,
                                                width: 50,
                                              ),
                                            ],
                                          )
                                        )
                                      ],
                                    ),
                                    children: [
                                    RadioListTile(
                                        controlAffinity: ListTileControlAffinity.trailing,
                                        title: Text(
                                          (controller.vpns[index]["ip"] == null)?
                                              ""
                                          :
                                          controller.vpns[index]["ip"],
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
                                    ],
                                  ),
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
        )
        :
        Scaffold(
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
    );
  }
}
