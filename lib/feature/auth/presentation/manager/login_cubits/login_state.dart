abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSuccess extends LoginState {
  final Map<String, dynamic> data;
  LoginSuccess({required this.data});
}

final class LoginLoading extends LoginState {}

final class LoginFailure extends LoginState {
  String errMessage;
  LoginFailure({required this.errMessage});
}
