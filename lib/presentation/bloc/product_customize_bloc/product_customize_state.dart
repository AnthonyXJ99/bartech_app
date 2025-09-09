part of 'product_customize_bloc.dart';

class ProductCustomizeState {
  final int quantity;
  final List<Map<String, dynamic>> ingredients;
  final List<Map<String, dynamic>> accompaniments;
  final bool showAccompaniments;
  final Set<int> loadingEnlargements; // Índices de acompañamientos que están cargando
  final String? errorMessage;

  ProductCustomizeState({
    required this.quantity,
    required this.ingredients,
    required this.accompaniments,
    required this.showAccompaniments,
    this.loadingEnlargements = const {},
    this.errorMessage,
  });

  ProductCustomizeState copyWith({
    int? quantity,
    List<Map<String, dynamic>>? ingredients,
    List<Map<String, dynamic>>? accompaniments,
    bool? showAccompaniments,
    Set<int>? loadingEnlargements,
    String? errorMessage,
    bool clearError = false,
  }) {
    return ProductCustomizeState(
      quantity: quantity ?? this.quantity,
      ingredients: ingredients ?? this.ingredients,
      accompaniments: accompaniments ?? this.accompaniments,
      showAccompaniments: showAccompaniments ?? this.showAccompaniments,
      loadingEnlargements: loadingEnlargements ?? this.loadingEnlargements,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }

  factory ProductCustomizeState.initial(
    List<Map<String, dynamic>> initialIngredients,
    List<Map<String, dynamic>> initialAccompaniments,
  ) => ProductCustomizeState(
    quantity: 1,
    ingredients: List<Map<String, dynamic>>.from(initialIngredients),
    accompaniments: List<Map<String, dynamic>>.from(initialAccompaniments),
    showAccompaniments: true, // Mostrar acompañamientos expandidos por defecto
    loadingEnlargements: {},
  );
}
