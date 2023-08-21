import 'package:dio/dio.dart';

import '../../routes/api/api_routes.dart';
import '../../storage/local_storage.dart';

class StripePaymentService {

  static Future<Response?> createPaymentIntent(Map<String, dynamic> details) async{
    try {
      String fullUrl = "$baseUrl$createPaymentIntentRoute";
      print("FULLURL:$fullUrl");
      print("REGISTERDETAILS:$details");

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
}