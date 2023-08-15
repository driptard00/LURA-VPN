import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lura/Widget/disabledButton/disabledButton.dart';
import 'package:lura/Widget/normalButton/normalButton.dart';
import 'package:lura/controllers/app_state_controller.dart';

import '../../../../services/Theme/theme_provider.dart';

class ReportAnIssueScreen extends StatelessWidget {
   ReportAnIssueScreen({super.key});

  final AppStateController _appStateController = Get.find<AppStateController>();
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

   @override
  Widget build(BuildContext context) {
    return GetBuilder<AppStateController>(
      builder: (controller) {
        return Scaffold(
          body: Form(
            key: _formKey,
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
                          "Report an Issue",
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
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Email Address",
                                  style: TextStyle(
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
                                      prefixIcon: const Icon(
                                        Icons.mail_outline,
                                        size: 20,
                                      )
                                  ),
                                  onChanged: (value){
                                    // controller.updateEmail(value);
                                  },
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Query Category",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "AxiformaMedium"
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                DropdownButtonFormField(
                                  items: controller.queryCategory.map(
                                    (category) {
                                      return DropdownMenuItem(
                                        value: category,
                                        child: Text(
                                          category,
                                        ),
                                      );
                                    }
                                  ).toList(),
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

                                      hintText: "Select"
                                  ),
                                  onChanged: (value){
                                    controller.updateQueryCategory(value);
                                  },
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Message",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "AxiformaMedium"
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.multiline,
                                  minLines: 7,
                                  maxLines: 7 ,
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

                                    hintText: "Enter message"
                                  ),
                                  validator: ValidationBuilder().build(),
                                  onChanged: (value){
                                    controller.updateMessage(value);
                                  },
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            (controller.isLoading)?
                            const Center(
                              child: SpinKitThreeBounce(
                                color: Color(0xff5D18EB),
                              ),
                            )
                                :
                            NormalButton.showNormalButton((){
                              (_formKey.currentState!.validate())?
                              controller.sendReport()
                                  :
                              AutovalidateMode.disabled;
                            }, "Send"),
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
          ),
        );
      }
    );
  }
  
}
