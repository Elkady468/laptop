import 'package:dio/dio.dart';

class Api {
  Dio _dio = Dio();

  post({required String token}) async {
    var response = await _dio.post(
      "https://elwekala.onrender.com/user/profile",
      data: {"token": token},
    );

    return response.data;
  }
}
