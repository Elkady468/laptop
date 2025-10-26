import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:laptop/feature/home/data/models/product_model.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  final Dio _dio = Dio();
  getFav() async {
    try {
      emit(TaskLoading());
      var response = await _dio.get(
        'https://elwekala.onrender.com/favorite',
        data: {"nationalId": "01578557885808"},
      );
      List<ProductModel> products = [];
      for (var item in response.data["favoriteProducts"]) {
        products.add(ProductModel.fromJson(item));
      }

      emit(TaskSuccess(products: products));
    } on Exception catch (e) {
      emit(TaskFailure(errMessage: e.toString()));
    }
  }
}
