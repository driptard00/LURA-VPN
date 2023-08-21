import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lura/controllers/app_state_controller.dart';
import 'package:lura/routes/app_routes/app_route_names.dart';
import 'package:lura/routes/app_routes/app_routes.dart';
import 'package:lura/services/Theme/theme_provider.dart';
import 'package:lura/services/Theme/theme_service.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey =
  "pk_test_51M7IS9IJjSM78lZtSDwzCFqSpaMdo5XXscfNCKuHcZkCacRBNSwn4lqYpqug1jmPm8xsE3vJkUiz7fDjFRf55Kt400su0ZZbkv";


  await GetStorage.init();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  AppStateController _appStateController = Get.put(AppStateController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppStateController>(
      builder: (controller) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeService().getThemeMode(),
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          getPages: getPage,
          initialRoute: splash_screen,
        );
      }
    );
  }
}
