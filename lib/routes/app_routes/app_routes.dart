import 'package:get/get.dart';
import 'package:lura/routes/app_routes/app_route_names.dart';
import 'package:lura/screens/authentication/login/loginScreen.dart';
import 'package:lura/screens/authentication/signUp/signUpScreen.dart';
import 'package:lura/screens/main/home_main/home_main_screen.dart';
import 'package:lura/screens/main/settings/account_info/account_info_screen.dart';
import 'package:lura/screens/onboarding_screen/onboarding_screen.dart';
import 'package:lura/screens/trial/accessAllBenefitScreen.dart';

import '../../screens/authentication/forgotpassword/createNewPassword.dart';
import '../../screens/authentication/forgotpassword/forgotpasswordScreen.dart';
import '../../screens/authentication/forgotpassword/verifyEmail.dart';
import '../../screens/authentication/signUp/verifyEmail.dart';
import '../../screens/main/settings/language/language_screen.dart';
import '../../screens/main/settings/settingsScreen.dart';
import '../../screens/splash_screen/splash_screen.dart';

List<GetPage> getPage = [

  // ======== SPLASH SCREEN ======
  GetPage(
      name: splash_screen,
      page: ()=> SplashScreen()
  ),

  // ======== ONBOARDING SCREEN ========
  GetPage(
      name: onboardingScreen,
      page: ()=> OnboardingScreen()
  ),

  // ======= AUTH SCREENS =========
  GetPage(
      name: signUpScreen,
      page: ()=> SignUpScreen()
  ),
  GetPage(
      name: signUpVerifyEmailScreen,
      page: ()=> SignUpVerifyEmailScreen()
  ),
  GetPage(
      name: forgotPasswordScreen,
      page: ()=> ForgotPasswordScreen()
  ),
  GetPage(
      name: forgotPasswordVerifyEmailScreen,
      page: ()=> ForgotPasswordVerifyEmailScreen()
  ),
  GetPage(
      name: createNewPasswordScreen,
      page: ()=> CreateNewPasswordScreen()
  ),
  GetPage(
      name: loginScreen,
      page: ()=> LoginScreen()
  ),


  // ========= TRIAL =========
  GetPage(
      name: accessAllBenefitScreen,
      page: ()=> AccessAllBenefitScreen()
  ),


  // ========= HOME MAIN =========
  GetPage(
      name: homeMainScreen,
      page: ()=> HomeMainScreen()
  ),
  GetPage(
      name: settingScreen,
      page: ()=> SettingsScreen()
  ),
  GetPage(
      name: accountInfoScreen,
      page: ()=> AccountInfoScreen()
  ),
  GetPage(
      name: languageScreen,
      page: ()=> LanguageScreen()
  ),

];