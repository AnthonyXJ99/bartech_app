part of 'cart_bloc.dart';

abstract class CartEvent {}

class AddToCart extends CartEvent {
  final CartItem item;
  AddToCart(this.item);
}

class RemoveFromCart extends CartEvent {
  final int index;
  RemoveFromCart(this.index);
}

class UpdateCartItem extends CartEvent {
  final int index;
  final int quantity;
  UpdateCartItem(this.index, this.quantity);
}

class ProccesCart extends CartEvent {}
