import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lura/routes/app_routes/app_route_names.dart';
import 'package:lura/services/authentication/authentication_service.dart';
import 'package:lura/storage/local_storage.dart';

class AuthStateController extends GetxController {
  bool _isChecked = false;
  bool _hidePassword = false;
  bool _hideConfirmPassword = false;
  bool _isLoading = false;
  String _firstName = "";
  String _lastName = "";
  String _email = "";
  String _password = "";
  String _passwordConfirm = "";
  dynamic _otpCode = 0;
  TextEditingController _emailController = TextEditingController();

  // getter
  bool get isChecked => _isChecked;
  bool get hidePassword => _hidePassword;
  bool get hideConfirmPassword => _hideConfirmPassword;
  bool get isLoading => _isLoading;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get email => _email;
  String get password => _password;
  String get passwordConfirm => _passwordConfirm;
  dynamic get otpCode => _otpCode;
  TextEditingController get emailController => _emailController;

  // setters
  updateIsChecked() {
    _isChecked = !_isChecked;
    update();
  }
  updateHidePassword() {
    _hidePassword = !_hidePassword;
    update();
  }
  updateHideConfirmPassword() {
    _hideConfirmPassword = !_hideConfirmPassword;
    update();
  }
  updateIsLoading(value) {
    _isLoading = value;
    update();
  }
  updateFirstName(value) {
    _firstName = value;
    update();
  }
  updateLastName(value) {
    _lastName = value;
    update();
  }
  updateEmail(value) {
    _email = value;
    update();
  }
  updatePassword(value) {
    _password = value;
    update();
  }
  updatePasswordConfirm(value) {
    _passwordConfirm = value;
    update();
  }
  updateOtpCode(value) {
    _otpCode = value;
    update();
  }
  getFirstName() async{
    _firstName = await LocalStorage().fetchFirstName();
    update();
  }
  updateEmailController() async{
    _emailController.text = await LocalStorage().fetchEmail();
    update();
  }

  // ========= API CALLs ==========

  // REGISTER
  Future<void> registerUser() async{
    updateIsLoading(true);

    Map<String, dynamic> details = {
      "firstname": _firstName,
      "lastname": _lastName,
      "email": _email,
      "password": _password,
      "password_confirmation": _password
    };
    print(details);

    var response = await AuthenticationServices.registerService(details);
    var responseData = response!.data;
    print(responseData);

    if(response.statusCode == 200){
      updateIsLoading(false);

      await LocalStorage().storeFirstName(responseData["data"]["firstname"]);
      await LocalStorage().storeEmail(responseData["data"]["email"]);


      Get.snackbar(
          "Success",
          responseData["message"],
        colorText: Colors.white,
        backgroundColor: Colors.green
      );
      
      Get.toNamed(signUpVerifyEmailScreen);
      
    } else {
      updateIsLoading(false);

      Get.snackbar(
          "Failed",
          responseData["message"],
          colorText: Colors.white,
          backgroundColor: Colors.red
      );
    }
  }

  // VERIFY EMAIL
  Future<void> verifyUserEmail() async{
    updateIsLoading(true);

    Map<String, dynamic> details = {
      "email": _email,
      "code": _otpCode
    };
    print(details);

    var response = await AuthenticationServices.verifyEmailService(details);
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

      Get.offAllNamed(accessAllBenefitScreen);

    } else {
      updateIsLoading(false);

      Get.snackbar(
          "Failed",
          responseData["message"],
          colorText: Colors.white,
          backgroundColor: Colors.red
      );
    }
  }

  // LOGIN
  Future<void> login() async{
    updateIsLoading(true);

    Map<String, dynamic> details = {
      "email": _emailController.text,
      "password": _password
    };
    print(details);

    var response = await AuthenticationServices.loginService(details);
    var responseData = response!.data;
    print(responseData);

    if(response.statusCode == 200){
      updateIsLoading(false);

      await LocalStorage().storeUserToken(responseData["data"]["token"]);
      await LocalStorage().storeFirstName(responseData["data"]["user"]["firstname"]);
      await LocalStorage().storeEmail(responseData["data"]["user"]["email"]);

      Get.snackbar(
          "Success",
          responseData["message"],
          colorText: Colors.white,
          backgroundColor: Colors.green
      );

      Get.offAllNamed(homeMainScreen);

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

  // RESEND REGISTER EMAIL CODE
  Future<void> resendEmailCodeRegister() async{
    updateIsLoading(true);

    Map<String, dynamic> details = {
      "email": _email,
    };
    print(details);

    var response = await AuthenticationServices.resendRegisterCodeService(details);
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
  }

  // RESEND PASSWORD EMAIL CODE
  Future<void> resendPasswordEmailCode() async{
    updateIsLoading(true);

    Map<String, dynamic> details = {
      "email": _email,
    };
    print(details);

    var response = await AuthenticationServices.resendPasswordCodeService(details);
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

      Get.toNamed(forgotPasswordVerifyEmailScreen);

    } else{
      updateIsLoading(false);

      Get.snackbar(
          "Failed",
          responseData["message"],
          colorText: Colors.white,
          backgroundColor: Colors.red
      );
    }
  }

  // RESET PASSWORD
  Future<void> resetPassword() async{
    updateIsLoading(true);

    Map<String, dynamic> details = {
      "email": _email,
      "code": _otpCode,
      "password": _password,
      "password_confirmation": _passwordConfirm
    };
    print(details);

    var response = await AuthenticationServices.resetPasswordService(details);
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

      Get.offAllNamed(loginScreen);

    } else {
      updateIsLoading(false);

      Get.snackbar(
          "Failed",
          responseData["message"],
          colorText: Colors.white,
          backgroundColor: Colors.red
      );
    }
  }

}