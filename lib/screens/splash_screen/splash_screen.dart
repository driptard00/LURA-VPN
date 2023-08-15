import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lura/controllers/app_state_controller.dart';
import 'package:lura/routes/app_routes/app_route_names.dart';
import 'package:lura/storage/local_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final AppStateController _appStateController = Get.put(AppStateController());

  checkForUser() async{
    String token = await LocalStorage().fetchUserToken() ;
    (token == "")?
    Get.toNamed(onboardingScreen)
    :
    Get.toNamed(loginScreen);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
        (){
          _appStateController.getGeoLocation();
          checkForUser();
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: Get.height,
            width: Get.width,
            color: Colors.black,
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: 10,
            top: 10,
            child: Image.asset(
              "images/world map.png",
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: 10,
            top: 10,
            child: Image.asset(
              "images/LURa.png",
            ),
          ),
          Positioned(
            right: 0,
            child: Image.asset(
              "images/rightEclipse.png",
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Image.asset(
              "images/leftEclipse.png",
            ),
          ),
          const Positioned(
              left: 10,
              right: 10,
              bottom: 20,
              child: Text(
                "©2023, Lura Inc. All Rights Reserved",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10
                ),
              )
          ),
        ],
      ),
    );
  }
}
