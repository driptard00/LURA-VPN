import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lura/routes/api/api_routes.dart';
import 'package:lura/routes/app_routes/app_route_names.dart';
import 'package:lura/screens/onboarding_screen/screens/screen1.dart';
import 'package:lura/screens/onboarding_screen/screens/screen2.dart';
import 'package:lura/screens/onboarding_screen/screens/screen3.dart';
import 'package:lura/services/Theme/theme_service.dart';
import 'package:lura/services/connection_log/connection_log_service.dart';
import 'package:lura/services/report_an_issue/report_an_issue_service.dart';
import 'package:lura/services/stripe_payment/stripe_payment_service.dart';
import 'package:lura/services/subscription/subscription_services.dart';
import 'package:lura/services/vpn_connection/vpn_connection_service.dart';
import 'package:lura/storage/local_storage.dart';

import '../model/user_model.dart';
import '../services/authentication/authentication_service.dart';

class AppStateController extends GetxController {

  // instant variables
  List<Widget> _onboardingScreens = [
    Screen1(),
    Screen2(),
    Screen3()
  ];
  List<String> _languages = [
    "English",
    "German",
    "French",
    "Spanish",
    "Japanese",
    "Italian",
    "Arabic",
    "Russian",
  ];
  List<Map<String, dynamic>> _vpnProtocols = [
    {
      "title": "Auto",
      "subtitle": "Rapid connection with ultra security.",
    },
    {
      "title": "Open VPN UDP/TCP",
      "subtitle": "Perfect for gaming and streaming.",
    },
    {
      "title": "IKEv2",
      "subtitle": "Safe and stable protocol",
    },
    {
      "title": "L2TP/IPsec",
      "subtitle": "Safely transfer your data ",
    },
    {
      "title": "PPTP",
      "subtitle": "Create a virtual private network with point-to-point tunneling. ",
    },
    {
      "title": "WireGuard®",
      "subtitle": "Connect quickly, save power and secure your data with advanced cryptography.",
    },
  ];
  List<dynamic> _connectionLogs = [];
  List<dynamic> _vpns = [];
  List<Map<String, dynamic>> _ports = [];
  Map<String, dynamic> _myLocation = {};
  Map<String, dynamic> _paymentIntent = {};
  List<Map<String, dynamic>> _cards = [
    {
      "type": "Mastercard",
      "cardNumber": "**** **** 9002 3456",
      "exp.Date": "01/24",
      "image": "images/mastercard.png"
    },
    {
      "type": "Mastercard",
      "cardNumber": "**** **** 3454 2344",
      "exp.Date": "05/29",
      "image": "images/mastercard.png"
    },
  ];
  List<dynamic> _subscriptionPlans = [
  ];
  List<String> _queryCategory = [
    "Missing subscription",
    "Payment",
    "IT support",
    "Others",
  ];
  List<bool> _subPlancheck = [
    false,
    false
  ];
  int _activeIndexScreen = 0;
  String _selectedLanguage = "";
  String _selectedVpnProtocol = "";
  String _message = "";
  String _selectedQueryCategory = "";
  var themeMode = ThemeMode.light.obs;
  var isDarkMode = ThemeService().isSaveDarkMode().obs;
  bool _isLoading = false;
  MyUser _myUser = MyUser();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  bool _isFreeChecked = false;
  bool _isYearlyChecked = false;
  bool _isMonthlyChecked = false;
  final _getStorage = GetStorage();
  bool _isSubActive = false;
  bool _isConnected = false;
  bool _isMalwareProtected = false;
  bool _isPhishingProtected = false;
  bool _onDatabreachScanner = false;
  String _selectedMethod = "GPAY";

  // getters
  List get onboardingScreens => _onboardingScreens;
  List get languages => _languages;
  List get vpnProtocols => _vpnProtocols;
  List get connectionLogs => _connectionLogs;
  List get queryCategory => _queryCategory;
  List get subscriptionPlans => _subscriptionPlans;
  int get activeIndexScreens => _activeIndexScreen;
  String get selectedLanguage => _selectedLanguage;
  String get selectedVpnProtocol => _selectedVpnProtocol;
  List get vpns => _vpns;
  List get ports => _ports;
  List get subPlansCheck => _subPlancheck;
  Map get myLocation => _myLocation;
  Map get paymentIntent => _paymentIntent;
  List get cards => _cards;
  bool get isLoading => _isLoading;
  MyUser get myUser => _myUser;
  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get emailController => _emailController;
  bool get isFreeChecked => _isFreeChecked;
  bool get isMonthlyChecked => _isMonthlyChecked;
  bool get isYearlyChecked => _isYearlyChecked;
  bool get isSubActive => _isSubActive;
  bool get isConnected => _isConnected;
  bool get isMalwareProtected => _isMalwareProtected;
  bool get isPhishingProtected => _isPhishingProtected;
  bool get onDatabreachScanner => _onDatabreachScanner;
  String get selectedMethod => _selectedMethod;


  // setters
  updateActiveIndex(value) {
    _activeIndexScreen = value;
    update();
  }
  updateConnectionLogs(value) {
    _connectionLogs = value;
    update();
  }
  updateSelectedLanguage(value) {
    _selectedLanguage = value;
    update();
  }
  updateSelectedVpnProtocol(value) {
    updateIsLoading(true);
    Future.delayed(
      Duration(seconds: 2,),
      (){
        updateIsLoading(false);
        _selectedVpnProtocol = value;
      }
    );
    update();
  }
  updateQueryCategory(value) {
    _selectedQueryCategory = value;
    update();
  }
  updateMessage(value) {
    _message = value;
    update();
  }
  updateIsLoading(value) {
    _isLoading = value;
    update();
  }
  updateServerList(value) {
    _vpns = value;
    update();
  }
  updatePortList(value) {
    _vpns = value;
    update();
  }
  updateMyLocation(value) {
    _myLocation = value;
    update();
  }
  fetchMyLocation() async{
    String location = await LocalStorage().fetchLocation();
    Map<String, dynamic> _decodedData = jsonDecode(location);

    updateMyLocation(_decodedData);
    print("My Location :::: $_decodedData");

    update();
  }
  toggleTheme(value) {
    isDarkMode.value = !isDarkMode.value;
    // themeMode = value ? ThemeMode.dark.obs : ThemeMode.light.obs;
    ThemeService().changeThemeMode();
    update();
  }
  updateSubscriptionList(value) {
    _subscriptionPlans = value;
    update();
  }
  updateIsFreeChecked() {
    _isFreeChecked = !_isFreeChecked;
    update();
  }
  updateIsMonthlyChecked() {
    _subPlancheck[0] = !_subPlancheck[0];
    update();
  }
  updateIsYearlyChecked() {
    _subPlancheck[1] = !_subPlancheck[1];
    update();
  }
  updatePaymentIntent(value) {
    _paymentIntent = value;
    update();
  }
  updateIsSubActive(value) {
    _isSubActive = value;
    update();
  }
  toggleIsConnected() {
    _isConnected = !_isConnected;
    update();
  }
  toggleIsMalwareProtected() {
    updateIsLoading(true);
    Future.delayed(
      Duration(seconds: 2),
      (){
        updateIsLoading(false);
        _isMalwareProtected = !_isMalwareProtected;
      }
    );
    update();
  }
  toggleIsPhishingProtected() {
    updateIsLoading(true);
    Future.delayed(
        Duration(seconds: 2),
            (){
          updateIsLoading(false);
          _isPhishingProtected = !_isPhishingProtected;
        }
    );
    update();
  }
  toggleOnDataBreachScanner() {
    updateIsLoading(true);
    Future.delayed(
        Duration(seconds: 2),
            (){
          updateIsLoading(false);
          _onDatabreachScanner = !_onDatabreachScanner;
        }
    );
    update();
  }
  updateSelectedMethod(value) {
    _selectedMethod = value;
    update();
  }

  // ======= API CALLS ======

  // GET PROFILE
  Future<void> getProfile() async{
    updateIsLoading(true);

    var response = await AuthenticationServices.getProfileService();
    var responseData = response!.data;
    print(responseData);

    if(response.statusCode == 200){
      updateIsLoading(false);

      updateIsSubActive(responseData["data"]["is_subscription_active"]);

      _myUser = MyUser.fromMap(responseData["data"]);

      _firstNameController.text = responseData["data"]["firstname"];
      _lastNameController.text = responseData["data"]["lastname"];
      _emailController.text = responseData["data"]["email"];

    } else {
      updateIsLoading(false);

      Get.snackbar(
          "Failed",
          responseData["message"],
          colorText: Colors.white,
          backgroundColor: Colors.red
      );
    }

    update();
  }

  // UPDATE PROFILE
  Future<void> updateProfile() async{
    updateIsLoading(true);

    Map<String, dynamic> details = {
      "firstname": _firstNameController.text,
      "lastname": _lastNameController.text,
      "username": "seun",
      "language": "EN",
      "receive_push_notification": false
    };
    print(details);

    var response = await AuthenticationServices.updateProfileService(details);
    var responseData = response!.data;
    print(responseData);

    if(response.statusCode == 200){
      updateIsLoading(false);

      await LocalStorage().storeFirstName(responseData["data"]["firstname"]);

      Get.snackbar(
          "Success",
          responseData["message"],
          colorText: Colors.white,
          backgroundColor: Colors.green
      );

    } else {
      updateIsLoading(false);

      Get.snackbar(
          "Failed",
          responseData["message"],
          colorText: Colors.white,
          backgroundColor: Colors.red
      );
    }

    update();
  }

  // REPORT AN ISSUE
  Future<void> sendReport() async{
    updateIsLoading(true);

    Map<String, dynamic> details = {
      "category": _selectedQueryCategory,
      "message": _message
    };
    print(details);

    var response = await ReportAnIssueService.sendReportService(details);
    var responseData = response!.data;
    print(responseData);

    if(response.statusCode == 200){
      updateIsLoading(false);

      Get.snackbar(
          "Success",
          responseData["message"],
          colorText: Colors.white,
          backgroundColor: Colors.green
      );

    } else {
      updateIsLoading(false);

      Get.snackbar(
          "Failed",
          responseData["message"],
          colorText: Colors.white,
          backgroundColor: Colors.red
      );
    }

    update();
  }

  // CONNECTION LOGS
  Future<void> getConnectionLogs() async{
    updateIsLoading(true);

    var response = await ConnectionLogService.getConnectionLogsService();
    var responseData = response!.data;
    print(responseData);

    if(response.statusCode == 200){
      updateIsLoading(false);

      updateConnectionLogs(responseData["data"]);

    } else {
      updateIsLoading(false);

      Get.snackbar(
          "Failed",
          responseData["message"],
          colorText: Colors.white,
          backgroundColor: Colors.red
      );
    }

    update();
  }

  // GET SERVER LIST
  Future<void> getServerList() async{

    var response = await VPNConnectionService.getServerListService();
    var responseData = response!.data;
    print(responseData);

    if(response.statusCode == 200){

      updateServerList(responseData["data"]);

    } else {

      Get.snackbar(
          "Failed",
          responseData["message"],
          colorText: Colors.white,
          backgroundColor: Colors.red
      );
    }

    update();
  }

  // GET SERVER LIST
  Future<void> getPortList() async{

    var response = await VPNConnectionService.getPortListService();
    var responseData = response!.data;
    print(responseData);

    if(response.statusCode == 200){

      updateServerList(responseData["data"]);

    } else {
      updateIsLoading(false);

      Get.snackbar(
          "Failed",
          responseData["message"],
          colorText: Colors.white,
          backgroundColor: Colors.red
      );
    }

    update();
  }

  // GET GEOLOCATION
  Future<void> getGeoLocation() async{
    var response = await VPNConnectionService.getGeoLocationService();
    var responseData = response!.data;
    print(responseData);

    if(response.statusCode == 200){

      updateMyLocation(responseData["data"]);

      String encodedData = jsonEncode(_myLocation);

      await LocalStorage().storeLocation(encodedData);

    } else {

    }

    update();
  }

  // GET SUBSCRIPTION PLANS
  Future<void> getSubscriptionPlans() async{
    var response = await SubscriptionPlanServices.getSubscriptionPlansService();
    var responseData = response!.data;
    print(responseData);

    if(response.statusCode == 200){

     updateSubscriptionList(responseData["data"]);

    } else {

    }

    update();
  }

  // GET CONFIGURATION
  Future<void> getConfiguration(dynamic serverID, portID) async{
    var response = await VPNConnectionService.getConfigurationService(serverID, portID);
    var responseData = response!.data;
    print(responseData);

    if(response.statusCode == 200){

    } else {

    }

    update();
  }

  // PAYMENT INTENT
  Future<void> createPaymentIntent(int subID) async{
    updateIsLoading(true);

    Map<String, dynamic> details = {
      "subscription_id": subID
    };
    print(details);

    var response = await StripePaymentService.createPaymentIntent(details);
    var responseData = response!.data;
    print(responseData);

    if(response.statusCode == 200){
      updateIsLoading(false);

      Get.snackbar(
          "Success",
          responseData["message"],
          colorText: Colors.white,
          backgroundColor: Colors.green
      );

      updatePaymentIntent(responseData["data"]);


      // INITIALIZE PAYMENT SHEET
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: _paymentIntent["client_secret"],
          style: (isDarkMode.value)? ThemeMode.dark : ThemeMode.light,
          merchantDisplayName: "Lura",
          googlePay: const PaymentSheetGooglePay(
            merchantCountryCode: "US",
            currencyCode: "US",
            testEnv: true
          ),
          billingDetailsCollectionConfiguration:  const BillingDetailsCollectionConfiguration(
            name: CollectionMode.always
          ),
          allowsDelayedPaymentMethods: true,
        )
      ).then((value) => {});

      // DISPLAY PAYMENT SHEET
      try{
        await Stripe.instance.presentPaymentSheet().then((value) => {
          Get.snackbar(
            "Success",
            "Payment Successful",
            colorText: Colors.white,
            backgroundColor: Colors.green
          ),
          Get.offAllNamed(loginScreen)
        });
      }catch(e) {
        print(e);
      }

    } else {
      updateIsLoading(false);

      Get.snackbar(
          "Failed",
          responseData["message"],
          colorText: Colors.white,
          backgroundColor: Colors.red
      );
    }

    update();
  }

  // LOGOUT
  Future<void> logoutAuth() async{
    await LocalStorage().deleteUserStorage();
    Get.snackbar(
        "Success",
        "Logout Successful",
        colorText: Colors.white,
        backgroundColor: Colors.green
    );
    Get.offAllNamed(loginScreen);
  }
}