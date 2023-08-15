import 'package:dio/dio.dart';
import 'package:lura/routes/api/api_routes.dart';

import '../../storage/local_storage.dart';

class AuthenticationServices {
  // ========== REGISTER ===========
  static Future<Response?> registerService(Map<String, dynamic> details) async{
    try {
      String fullUrl = "$baseUrl$register";
      print("FULLURL:$fullUrl");
      print("REGISTERDETAILS:$details");

      var response = await Dio().post(
          fullUrl,
          data: details
      );
      return response;

    } on DioException catch (error) {
      if(error.response != null){
        return error.response;
      }
      throw Exception(error.response);
    }
  }

  // ========== LOGIN ===========
  static Future<Response?> loginService(Map<String, dynamic> details) async{
    try {
      String fullUrl = "$baseUrl$login";
      print("FULLURL:$fullUrl");
      print("REGISTERDETAILS:$details");

      var response = await Dio().post(
          fullUrl,
          data: details
      );
      return response;

    } on DioException catch (error) {
      if(error.response != null){
        return error.response;
      }
      throw Exception(error.response);
    }
  }

  // ========== RESEND REGISTER CODE ===========
  static Future<Response?> resendRegisterCodeService(Map<String, dynamic> details) async{
    try {
      String fullUrl = "$baseUrl$resendRegisterCode";
      print("FULLURL:$fullUrl");
      print("REGISTERDETAILS:$details");

      var response = await Dio().post(
          fullUrl,
          data: details
      );
      return response;

    } on DioException catch (error) {
      if(error.response != null){
        return error.response;
      }
      throw Exception(error.response);
    }
  }

  // ========== VERIFY EMAIL ===========
  static Future<Response?> verifyEmailService(Map<String, dynamic> details) async{
    try {
      String fullUrl = "$baseUrl$verifyEmailRegister";
      print("FULLURL:$fullUrl");
      print("REGISTERDETAILS:$details");

      var response = await Dio().post(
          fullUrl,
          data: details
      );
      return response;

    } on DioException catch (error) {
      if(error.response != null){
        return error.response;
      }
      throw Exception(error.response);
    }
  }

  // ========== RESEND PASSWORD CODE ===========
  static Future<Response?> resendPasswordCodeService(Map<String, dynamic> details) async{
    try {
      String fullUrl = "$baseUrl$resendPasswordCode";
      print("FULLURL:$fullUrl");
      print("REGISTERDETAILS:$details");

      var response = await Dio().post(
          fullUrl,
          data: details
      );
      return response;

    } on DioException catch (error) {
      if(error.response != null){
        return error.response;
      }
      throw Exception(error.response);
    }
  }

  // ========== RESET PASSWORD ===========
  static Future<Response?> resetPasswordService(Map<String, dynamic> details) async{
    try {
      String fullUrl = "$baseUrl$resetPassword";
      print("FULLURL:$fullUrl");
      print("REGISTERDETAILS:$details");

      var response = await Dio().post(
          fullUrl,
          data: details
      );
      return response;

    } on DioException catch (error) {
      if(error.response != null){
        return error.response;
      }
      throw Exception(error.response);
    }
  }

  // ========== GET PROFILE ===========
  static Future<Response?> getProfileService() async{
    try {
      String fullUrl = "$baseUrl$getProfile";
      print("FULLURL:$fullUrl");

      String token = await LocalStorage().fetchUserToken();

      var response = await Dio().get(
        fullUrl,
        options: Options(
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
              "Authorization": "Bearer $token"
            }
        )
      );
      return response;

    } on DioException catch (error) {
      if(error.response != null){
        return error.response;
      }
      throw Exception(error.response);
    }
  }

  // ========== UPDATE PROFILE ===========
  static Future<Response?> updateProfileService(Map<String, dynamic> details) async{
    try {
      String fullUrl = "$baseUrl$updateProfile";
      print("FULLURL:$fullUrl");

      String token = await LocalStorage().fetchUserToken();

      var response = await Dio().post(
        fullUrl,
        data: details,
        options: Options(
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
              "Authorization": "Bearer $token"
            }
        )
      );
      return response;

    } on DioException catch (error) {
      if(error.response != null){
        return error.response;
      }
      throw Exception(error.response);
    }
  }

  // ========== UPDATE PROFILE ===========
  static Future<Response?> changePasswordService(Map<String, dynamic> details) async{
    try {
      String fullUrl = "$baseUrl$changePassword";
      print("FULLURL:$fullUrl");

      String token = await LocalStorage().fetchUserToken();

      var response = await Dio().post(
          fullUrl,
          options: Options(
              headers: {
                "Content-Type": "application/json",
                "Accept": "application/json",
                "Authorization": "Bearer $token"
              }
          )
      );
      return response;

    } on DioException catch (error) {
      if(error.response != null){
        return error.response;
      }
      throw Exception(error.response);
    }
  }

}