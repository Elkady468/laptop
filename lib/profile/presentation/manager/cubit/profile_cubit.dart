import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:laptop/core/shared.dart';
import 'package:laptop/profile/data/api.dart';
import 'package:laptop/profile/data/model/profile_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.api) : super(ProfileInitial());
  final Api api;
  getProfile() async {
    try {
      emit(ProfileLoading());
      var result = await api.post(token: Shared.getString(key: "token"));
      emit(ProfileSuccess(profileModel: ProfileModel.fromJson(result["user"])));
    } catch (e) {
      emit(ProfileFailure(errMessage: e.toString()));
    }
  }
}
