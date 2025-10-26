import 'dart:developer';

import 'package:laptop/core/api_service.dart';
import 'package:laptop/feature/home/data/models/product_model.dart';
import 'package:laptop/feature/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});
  @override
  Future getProduct() async {
    try {
      var data = await apiService.get();
      List<ProductModel> products = [];
      for (var item in data["product"]) {
        products.add(ProductModel.fromJson(item));
      }
      log("$data");
      return products;
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to load Product data: $e');
    }
  }
}
