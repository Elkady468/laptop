part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class AddCartSuccess extends CartState {}

final class CartSussess extends CartState {
  final List<CartModel> products;

  const CartSussess({required this.products});
}

final class CartLoading extends CartState {}

final class CartFailure extends CartState {
  final String errMessage;

  const CartFailure({required this.errMessage});
}

final class updateCartSuccess extends CartState {}
