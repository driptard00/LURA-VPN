import 'package:dio/dio.dart';

import '../../routes/api/api_routes.dart';
import '../../storage/local_storage.dart';

class ConnectionLogService {
  static Future<Response?> getConnectionLogsService() async{
    try {
      String fullUrl = "$baseUrl$getConnectionLogs";
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