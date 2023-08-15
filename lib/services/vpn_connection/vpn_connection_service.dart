import 'package:dio/dio.dart';

import '../../routes/api/api_routes.dart';
import '../../storage/local_storage.dart';

class VPNConnectionService {
  static Future<Response?> getServerListService() async{
    try {
      String fullUrl = "$baseUrl$getServerList";
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

  static Future<Response?> getPortListService() async{
    try {
      String fullUrl = "$baseUrl$getPortList";
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

  static Future<Response?> getGeoLocationService() async{
    try {
      String fullUrl = "$baseUrl$getGeolocationList";
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
}