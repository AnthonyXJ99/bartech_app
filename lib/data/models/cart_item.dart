import 'package:bartech_app/data/models/model_products.dart';

class CartItem {
  final Products product;
  int quantity;
  final List<Map<String, dynamic>> accompaniments; // o List<AccompanimentModel>
  final List<Map<String, dynamic>> ingredients;

  CartItem({
    required this.product,
    this.quantity = 1,
    this.accompaniments = const [],
    this.ingredients = const [],
  });
}
