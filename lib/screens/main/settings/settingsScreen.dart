import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lura/controllers/app_state_controller.dart';
import 'package:lura/routes/app_routes/app_route_names.dart';
import 'package:lura/services/Theme/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
   SettingsScreen({super.key});

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
                            "Settings",
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
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Row(
                                children: [
                                  Icon(
                                    Iconsax.tag,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "User ID: 000223947w3d9hs9q",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "AxiformaBold"
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Iconsax.copy,
                                size: 24,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            "General",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "AxiformaBold"
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          _listTile("Account Information", Iconsax.user, Iconsax.arrow_right_34, (){
                            Get.toNamed(accountInfoScreen);
                          }),
                          const Divider(
                            color: Color(0xffE2E4E2),
                          ),
                          _listTile("Language", Iconsax.language_circle, Iconsax.arrow_right_34, (){
                            Get.toNamed(languageScreen);
                          }),
                          const Divider(
                            color: Color(0xffE2E4E2),
                          ),
                          _listTile2(
                            "Notifications",
                            Iconsax.notification,
                            CupertinoSwitch(
                              value: true,
                              onChanged: (value){},
                              activeColor: const Color(0xffBD67F2),
                            ),
                            (){},
                          ),
                          const Divider(
                            color: Color(0xffE2E4E2),
                          ),
                          Obx(() => _listTile2(
                            "Dark Mode",
                            Icons.palette_outlined,
                            CupertinoSwitch(
                              value: _appStateController.isDarkMode.value,
                              onChanged: (value){
                                _appStateController.toggleTheme(value);
                              },
                              activeColor: const Color(0xffBD67F2),
                            ),
                                (){},
                          ),
                          ),
                          const Divider(
                            color: Color(0xffE2E4E2),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Connections",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "AxiformaBold"
                            ),
                          ),
                          _listTile("Connection Log", Icons.history, Iconsax.arrow_right_34, (){
                            Get.toNamed(connectionLogScreen);
                          }),
                          const Divider(
                            color: Color(0xffE2E4E2),
                          ),
                          _listTile("Connection Settings", Iconsax.setting_2, Iconsax.arrow_right_34, (){
                            Get.toNamed(connectionSettingScreen);
                          }),
                          const Divider(
                            color: Color(0xffE2E4E2),
                          ),
                          _listTile("VPN Protocol", Iconsax.lock, Iconsax.arrow_right_34, (){
                            Get.toNamed(vpnProtocolScreen);
                          }),
                          const Divider(
                            color: Color(0xffE2E4E2),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Support",
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "AxiformaBold"
                            ),
                          ),
                          _listTile("About us", Icons.info_outline, Iconsax.arrow_right_34, (){
                            Get.toNamed(aboutUsScreen);
                          }),
                          const Divider(
                            color: Color(0xffE2E4E2),
                          ),
                          _listTile("Report an Issue", Icons.chat_bubble_outline, Iconsax.arrow_right_34, (){
                            Get.toNamed(reportAnIssueScreen);
                          }),
                          const Divider(
                            color: Color(0xffE2E4E2),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            height: 50,
                            width: Get.width,
                            child: TextButton(
                              onPressed: (){},
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                side: const BorderSide(
                                  color: Color(0xffF34E4E)
                                )
                              ),
                              child: const Text(
                                "Logout",
                                style: TextStyle(
                                  color: Color(0xffF34E4E),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
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

  ListTile _listTile(String title, IconData leadingIcon, IconData trailingIcon, Function() onTap) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        leadingIcon,
        size: 20,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 14,
            fontFamily: "AxiformaMedium"
        ),
      ),
      trailing: Icon(
        trailingIcon,
        size: 20,
      ),
    );
  }
  ListTile _listTile2(String title, IconData leadingIcon, CupertinoSwitch trailingIcon, Function() onTap) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        leadingIcon,
        size: 20,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 14,
            fontFamily: "AxiformaMedium"
        ),
      ),
      trailing: trailingIcon
    );
  }
}
