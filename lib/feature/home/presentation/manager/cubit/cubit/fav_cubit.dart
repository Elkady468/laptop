import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:laptop/core/api_service.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit(this.apiService) : super(FavInitial());
  final ApiService apiService;
  addFav() async {
    emit(FavLoading());
    try {
      await apiService.post();
      emit(FavSuccess());
      log("Success");
    } catch (e) {
      emit(FavFailure(errMesaage: e.toString()));
      log("Failure");
    }
  }
}
