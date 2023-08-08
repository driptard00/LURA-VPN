import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lura/Widget/disabledButton/disabledButton.dart';
import 'package:lura/Widget/normalButton/normalButton.dart';

class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            Container(
              height: 170,
              width: Get.width,
              padding: EdgeInsets.symmetric(horizontal: 20),
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
                    onTap: (){
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
                    "Account Information",
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
                padding: EdgeInsets.symmetric(horizontal: 20),
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "First Name",
                                  style: TextStyle(
                                      color: Color(0xff222823),
                                      fontSize: 14,
                                      fontFamily: "AxiformaMedium"
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: const BorderSide(
                                              color: Color(0xffA7AEA8),
                                              width: 1
                                          )
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: const BorderSide(
                                              color: Color(0xffC880F4),
                                              width: 1
                                          )
                                      ),
                                      prefixIcon: Icon(
                                        Iconsax.user,
                                        size: 20,
                                        color: Color(0xff222823),
                                      )
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Last Name",
                                  style: TextStyle(
                                      color: Color(0xff222823),
                                      fontSize: 14,
                                      fontFamily: "AxiformaMedium"
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: const BorderSide(
                                              color: Color(0xffA7AEA8),
                                              width: 1
                                          )
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: const BorderSide(
                                              color: Color(0xffC880F4),
                                              width: 1
                                          )
                                      ),
                                      prefixIcon: Icon(
                                        Iconsax.user,
                                        size: 20,
                                        color: Color(0xff222823),
                                      )
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Email Address",
                            style: TextStyle(
                                color: Color(0xff222823),
                                fontSize: 14,
                                fontFamily: "AxiformaMedium"
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                        color: Color(0xffA7AEA8),
                                        width: 1
                                    )
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                        color: Color(0xffC880F4),
                                        width: 1
                                    )
                                ),
                                prefixIcon: Icon(
                                  Icons.mail_outline,
                                  size: 20,
                                  color: Color(0xff222823),
                                )
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      _listTile("Subscription Plans", Iconsax.book, Iconsax.arrow_right_34, () => null),
                      const Divider(
                        color: Color(0xffE2E4E2),
                      ),
                      _listTile("Card Details", Iconsax.card, Iconsax.arrow_right_34, () => null),
                      const Divider(
                        color: Color(0xffE2E4E2),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      DisabledButton.showDisabledButton(
                        "Update Details"
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

  ListTile _listTile(String title, IconData leadingIcon, IconData trailingIcon, Function() onTap) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        leadingIcon,
        color: const Color(0xff222823),
        size: 20,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xff222823),
          fontSize: 14,
        ),
      ),
      trailing: Icon(
        trailingIcon,
        color: const Color(0xff222823),
        size: 20,
      ),
    );
  }
}
