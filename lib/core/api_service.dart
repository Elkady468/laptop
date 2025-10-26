import 'package:dio/dio.dart';
import 'package:laptop/core/shared.dart';

class ApiService {
  final Dio _dio = Dio();

  get() async {
    var response = await _dio.get(
      "https://elwekala.onrender.com/product/Laptops",
    );
    return response.data;
  }

  post() async {
    _dio.post(
      "https://elwekala.onrender.com/favorite",
      data: {
        "nationalId": "01210567022258",
        "productId": "64666d3a91c71d884185b774",
      },
    );
  }

  login({required String email, required String password}) async {
    var response = await _dio.post(
      "https://elwekala.onrender.com/user/login",
      data: {"email": email, "password": password},
    );
    Shared.setString(key: "token", value: response.data["user"]["token"]);
    Shared.setString(key: "ID", value: response.data["user"]["nationalId"]);

    return response.data;
  }
}
//id = 64666d3a91c71d884185b774