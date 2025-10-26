import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:laptop/feature/home/data/models/product_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  final Dio _dio = Dio();

  updateCart({required num quantiy, required String productId}) async {
    try {
      emit(CartLoading());
      await _dio.put(
        "https://elwekala.onrender.com/cart",
        data: {
          "nationalId": "01578557885808",
          "productId": productId,
          "quantity": quantiy,
        },
      );
      emit(updateCartSuccess());
      fetshCart();
    } catch (e) {
      log(e.toString());
      emit(CartFailure(errMessage: e.toString()));
    }
  }

  fetshCart() async {
    try {
      emit(CartLoading());
      var response = await _dio.get(
        "https://elwekala.onrender.com/cart/allProducts",
        data: {"nationalId": "01578557885808"},
      );
      var data = response.data;
      List<CartModel> products = [];
      for (var item in data["products"]) {
        products.add(CartModel.fromJson(item));
      }
      emit(CartSussess(products: products));
    } catch (e) {
      emit(CartFailure(errMessage: e.toString()));
      log(e.toString());
    }
    // log("${data}");
  }

  addCart({required String id}) async {
    try {
      var response = await _dio.post(
        "https://elwekala.onrender.com/cart/add",
        data: {
          "nationalId": "01578557885808",
          "productId": id,

          "quantity": "1",
        },
      );
      fetshCart();
      emit(AddCartSuccess());
    } catch (e) {
      log('message');
      log(e.toString());
    }
  }
}
