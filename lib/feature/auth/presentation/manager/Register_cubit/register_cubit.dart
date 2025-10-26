
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final Dio _dio = Dio();
  Future<void> RegisterUser({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
    required String image,
    required String id,
    required String gender,
  }) async {
    try {
      emit(RegisterLoading());
      var response = await _dio.post(
        "https://elwekala.onrender.com/user/register",
        data: {
          "email": email,
          "password": password,
          "name": name,
          "phone": phoneNumber,
          "nationalId": id,
          "gender": gender,
          "profileImage": image,
        },
      );
      emit(RegisterSuccess(message: response.data["message"]));
    } catch (e) {
      emit(RegisterFailure(errMessage: e.toString()));
    }
  }
}
