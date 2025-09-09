// lib/data/repositories/product_categories_repository.dart

import '../models/product_category.dart';
import '../services/product_categories_service.dart';

class ProductCategoriesRepository {
  final ProductCategoriesService _service;
  ProductCategoriesRepository(this._service);

  Future<List<ProductCategory>> getAllCategories() => _service.getAll();

  Future<List<ProductCategory>> getCategoriesPaged({
    int pageNumber = 1,
    int pageSize = 10,
    String? search,
  }) => _service.getPaged(
    pageNumber: pageNumber,
    pageSize: pageSize,
    search: search,
  );

  Future<ProductCategory> getCategoryByCode(String code) =>
      _service.getByCode(code);

  Future<ProductCategory> createCategory(ProductCategory category) =>
      _service.create(category);

  Future<void> updateCategory(String code, ProductCategory category) =>
      _service.update(code, category);

  Future<void> deleteCategory(String code) => _service.delete(code);

  Future<List<ProductCategory>> getCategoriesByGroup(String groupCode) =>
      _service.getByGroup(groupCode);

  Future<List<ProductCategory>> getAllWithAccompaniments() async {
    return await _service.getAllWithAccompaniments();
  }
}
