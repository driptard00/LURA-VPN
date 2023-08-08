import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lura/routes/app_routes/app_route_names.dart';
import 'package:lura/routes/app_routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Axiforma"
      ),
      getPages: getPage,
      initialRoute: splash_screen,
    );
  }
}
