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

class ToggleAccompanimentEnlargement extends ProductCustomizeEvent {
  final int index;
  ToggleAccompanimentEnlargement({required this.index});
}

class ToggleAccompanimentsPanel extends ProductCustomizeEvent {}
