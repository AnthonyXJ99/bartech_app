part of 'product_customize_bloc.dart';

class ProductCustomizeState {
  final int quantity;
  final List<Map<String, dynamic>> ingredients;
  final List<Map<String, dynamic>> accompaniments;
  final bool showAccompaniments;

  ProductCustomizeState({
    required this.quantity,
    required this.ingredients,
    required this.accompaniments,
    required this.showAccompaniments,
  });

  ProductCustomizeState copyWith({
    int? quantity,
    List<Map<String, dynamic>>? ingredients,
    List<Map<String, dynamic>>? accompaniments,
    bool? showAccompaniments,
  }) {
    return ProductCustomizeState(
      quantity: quantity ?? this.quantity,
      ingredients: ingredients ?? this.ingredients,
      accompaniments: accompaniments ?? this.accompaniments,
      showAccompaniments: showAccompaniments ?? this.showAccompaniments,
    );
  }

  factory ProductCustomizeState.initial(
    List<Map<String, dynamic>> initialIngredients,
    List<Map<String, dynamic>> initialAccompaniments,
  ) => ProductCustomizeState(
    quantity: 1,
    ingredients: List<Map<String, dynamic>>.from(initialIngredients),
    accompaniments: List<Map<String, dynamic>>.from(initialAccompaniments),
    showAccompaniments: false,
  );
}
