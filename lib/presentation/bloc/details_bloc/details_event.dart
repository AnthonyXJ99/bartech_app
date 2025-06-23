import 'package:bartech_app/data/models/product_category.dart';
import 'package:equatable/equatable.dart';

// Base
abstract class DetailsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// Para cargar categorías desde la API
class LoadCategoriesEvent extends DetailsEvent {}

// Cuando una categoría/grupo es seleccionada
class CategorySelectedEvent extends DetailsEvent {
  final ProductCategory category;
  CategorySelectedEvent(this.category);

  @override
  List<Object?> get props => [category];
}
