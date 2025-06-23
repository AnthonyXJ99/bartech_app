import 'package:bartech_app/data/models/product.dart';
import 'package:equatable/equatable.dart';
import 'package:bartech_app/data/models/product_category.dart';

class DetailsState extends Equatable {
  final List<Product> products;
  final List<ProductCategory> categories; // <-- NUEVO
  final ProductCategory? selectedCategory;
  final bool isLoading;
  final String error;

  const DetailsState({
    this.categories = const [],
    this.selectedCategory,
    this.products = const [],
    this.isLoading = false,
    this.error = '',
  });

  DetailsState copyWith({
    List<ProductCategory>? categories,
    ProductCategory? selectedCategory,
    List<Product>? products,
    bool? isLoading,
    String? error,
  }) {
    return DetailsState(
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? '',
    );
  }

  @override
  List<Object?> get props => [
    categories,
    selectedCategory,
    products,
    isLoading,
    error,
  ];
}
