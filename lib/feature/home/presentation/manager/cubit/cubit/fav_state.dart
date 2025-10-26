part of 'fav_cubit.dart';

sealed class FavState extends Equatable {
  const FavState();

  @override
  List<Object> get props => [];
}

final class FavInitial extends FavState {}

final class FavLoading extends FavState {}

final class FavSuccess extends FavState {}

final class FavFailure extends FavState {
  final String errMesaage;

  const FavFailure({required this.errMesaage});
}
