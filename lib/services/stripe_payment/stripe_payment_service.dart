import 'package:dio/dio.dart';

class StripePaymentService {

  Map<String, dynamic>? paymentIntent;

  static Future<void> createPaymentIntent(String amount) async{
    try{
      Map<String, dynamic> body = {
        "amount": amount,
        "currency":"US"
      };

      // var response = await Dio().post(
      //
      // )
    } catch(e) {

    }
  }
}