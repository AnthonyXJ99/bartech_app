part of 'product_customize_bloc.dart';

abstract class ProductCustomizeEvent {}

class SetProductQuantity extends ProductCustomizeEvent {
  final int quantity;
  SetProductQuantity(this.quantity);
}

class SetIngredientAmount extends ProductCustomizeEvent {
  final int index;
  final int amount;
  SetIngredientAmount({required this.index, required this.amount});
}

class SetAccompanimentQuantity extends ProductCustomizeEvent {
  final int index;
  final int quantity;
  SetAccompanimentQuantity({required this.index, required this.quantity});
}

class RequestAccompanimentEnlargement extends ProductCustomizeEvent {
  final int index;
  RequestAccompanimentEnlargement({required this.index});
}

class SetAccompanimentEnlargement extends ProductCustomizeEvent {
  final int index;
  final Product? enlargementProduct;
  final bool isEnlarged;
  SetAccompanimentEnlargement({
    required this.index, 
    this.enlargementProduct,
    required this.isEnlarged,
  });
}

class ToggleAccompanimentsPanel extends ProductCustomizeEvent {}
