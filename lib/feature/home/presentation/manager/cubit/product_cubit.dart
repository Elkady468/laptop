import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:laptop/feature/home/data/models/product_model.dart';
import 'package:laptop/feature/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.homeRepo) : super(SurahInitial());
  final HomeRepo homeRepo;
  fetchProduct() async {
    emit(ProductLoading());
    try {
      var result = await homeRepo.getProduct();
      emit(ProductSuccess(products: result));
    } catch (e) {
      emit(ProductFailure(errMessage: e.toString()));
    }
  }
}
