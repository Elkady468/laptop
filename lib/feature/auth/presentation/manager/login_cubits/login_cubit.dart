import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laptop/core/api_service.dart';
import 'package:laptop/core/values.dart';
import 'package:laptop/feature/auth/presentation/manager/login_cubits/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.apiService) : super(LoginInitial());
  final ApiService apiService;
  Future<void> LoginUser({
    required String email,
    required String password,
  }) async {
    try {
      emit(LoginLoading());
      var result = await apiService.login(email: email, password: password);
      log("id : $id");
      log("token : $token");
      emit(LoginSuccess(data: result));
    } catch (e) {
      log("Error");
      emit(LoginFailure(errMessage: e.toString()));
    }
  }
}
