import 'package:get/get.dart';
import 'package:lura/routes/app_routes/app_route_names.dart';
import 'package:lura/screens/authentication/login/loginScreen.dart';
import 'package:lura/screens/authentication/signUp/signUpScreen.dart';
import 'package:lura/screens/main/home_main/home_main_screen.dart';
import 'package:lura/screens/main/settings/account_info/account_info_screen.dart';
import 'package:lura/screens/main/settings/account_info/subscription%20plans/addCardScreen.dart';
import 'package:lura/screens/main/settings/account_info/subscription%20plans/paymentDetailScreen.dart';
import 'package:lura/screens/main/settings/connection_settings/connection_settings.dart';
import 'package:lura/screens/main/settings/support/about_us_screen.dart';
import 'package:lura/screens/main/settings/support/report_an_issue_screen.dart';
import 'package:lura/screens/onboarding_screen/onboarding_screen.dart';
import 'package:lura/screens/trial/accessAllBenefitScreen.dart';
import 'package:lura/screens/trial/addPaymentMethodScreen.dart';

import '../../screens/authentication/forgotpassword/createNewPassword.dart';
import '../../screens/authentication/forgotpassword/forgotpasswordScreen.dart';
import '../../screens/authentication/forgotpassword/verifyEmail.dart';
import '../../screens/authentication/signUp/verifyEmail.dart';
import '../../screens/main/settings/account_info/subscription plans/subscription_plans_screen.dart';
import '../../screens/main/settings/connection_log/connection_log_screen.dart';
import '../../screens/main/settings/language/language_screen.dart';
import '../../screens/main/settings/settingsScreen.dart';
import '../../screens/main/settings/vpn_protocol/vpn_protocol.dart';
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
  GetPage(
      name: addPaymentMethodScreen,
      page: ()=> AddPaymentMethodScreen()
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
  GetPage(
      name: connectionLogScreen,
      page: ()=> ConnectionLogScreen()
  ),
  GetPage(
      name: connectionSettingScreen,
      page: ()=> ConnectionSettingScreen()
  ),
  GetPage(
      name: vpnProtocolScreen,
      page: ()=> VPNProtocolScreen()
  ),
  GetPage(
      name: reportAnIssueScreen,
      page: ()=> ReportAnIssueScreen()
  ),
  GetPage(
      name: aboutUsScreen,
      page: ()=> AboutUsScreen()
  ),
  GetPage(
      name: subscriptionPlansScreen,
      page: ()=> SubscriptionPlansScreen()
  ),
  GetPage(
      name: paymentDetailScreen,
      page: ()=> PaymentDetailScreen()
  ),
  GetPage(
      name: addCardScreen,
      page: ()=> AddCardScreen()
  ),

];