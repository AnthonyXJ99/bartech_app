part of 'cart_bloc.dart';

class CartState {
  final List<CartItem> items;

  CartState({required this.items});

  double get subtotal => items.fold(0.0, (sum, item) {
    final basePrice =
        (item.product.price -
        (item.product.discount! > 0 ? item.product.discount! : 0));
    final accompanimentsTotal = item.accompaniments.fold<double>(
      0.0,
      (acc, accItem) =>
          acc + ((accItem['quantity'] ?? 0) * (accItem['price'] ?? 0.0)),
    );
    return sum + (basePrice * item.quantity) + accompanimentsTotal;
  });
}
