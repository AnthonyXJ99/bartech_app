import 'package:bartech_app/data/models/product.dart';
import 'package:equatable/equatable.dart';
import 'package:bartech_app/data/models/product_category.dart';
import 'package:bartech_app/data/models/category_accompaniment.dart';

class DetailsState extends Equatable {
  final List<Product> products;
  final List<ProductCategory> categories;
  final ProductCategory? selectedCategory;
  final List<CategoryAccompaniment> categoryAccompaniments;
  final bool isLoading;
  final String error;

  const DetailsState({
    this.categories = const [],
    this.selectedCategory,
    this.products = const [],
    this.categoryAccompaniments = const [],
    this.isLoading = false,
    this.error = '',
  });

  DetailsState copyWith({
    List<ProductCategory>? categories,
    ProductCategory? selectedCategory,
    List<Product>? products,
    List<CategoryAccompaniment>? categoryAccompaniments,
    bool? isLoading,
    String? error,
  }) {
    return DetailsState(
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      products: products ?? this.products,
      categoryAccompaniments: categoryAccompaniments ?? this.categoryAccompaniments,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? '',
    );
  }

  @override
  List<Object?> get props => [
    categories,
    selectedCategory,
    products,
    categoryAccompaniments,
    isLoading,
    error,
  ];
}
