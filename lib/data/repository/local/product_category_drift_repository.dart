import 'package:bartech_app/database/database.dart';
import 'package:bartech_app/database/models.dart';
import 'package:bartech_app/data/models/product_category.dart' as ApiModels;
import 'package:drift/drift.dart';

class ProductCategoryDriftRepository {
  final AppDatabase _database;

  ProductCategoryDriftRepository(this._database);

  // Insertar categorías desde API
  Future<void> insertProductCategories(List<ApiModels.ProductCategory> categories) async {
    await _database.transaction(() async {
      for (final category in categories) {
        final companion = DriftHelpers.productCategoryFromApi(category);
        await _database.insertProductCategory(companion);
      }
    });
  }

  // Obtener todas las categorías
  Future<List<ApiModels.ProductCategory>> getAllProductCategories() async {
    final categoryEntities = await _database.getAllProductCategories();
    return categoryEntities.map((entity) => entity.toApiModel()).toList();
  }

  // Stream reactivo de categorías
  Stream<List<ApiModels.ProductCategory>> watchAllProductCategories() {
    return _database.watchAllProductCategories().map(
          (entities) => entities.map((entity) => entity.toApiModel()).toList(),
    );
  }

  // Obtener categorías habilitadas
  Future<List<ApiModels.ProductCategory>> getEnabledCategories() async {
    final allCategories = await getAllProductCategories();
    return allCategories.where((category) => category.enabled == 'Y').toList();
  }

  // Stream de categorías habilitadas
  Stream<List<ApiModels.ProductCategory>> watchEnabledCategories() {
    return watchAllProductCategories().map(
          (categories) => categories.where((category) => category.enabled == 'Y').toList(),
    );
  }

  // Obtener categoría por código
  Future<ApiModels.ProductCategory?> getCategoryByCode(String categoryCode) async {
    try {
      final categoryEntity = await (_database.select(_database.productCategories)
        ..where((c) => c.categoryItemCode.equals(categoryCode))).getSingle();

      return categoryEntity.toApiModel();
    } catch (e) {
      return null;
    }
  }

  // Buscar categorías
  Future<List<ApiModels.ProductCategory>> searchCategories(String query) async {
    final allCategories = await getAllProductCategories();
    return allCategories.where((category) =>
    category.categoryItemName.toLowerCase().contains(query.toLowerCase()) ||
        (category.description?.toLowerCase().contains(query.toLowerCase()) ?? false)
    ).toList();
  }

  // Obtener categorías ordenadas por visOrder
  Future<List<ApiModels.ProductCategory>> getCategoriesOrdered() async {
    final categoryEntities = await (_database.select(_database.productCategories)
      ..orderBy([(c) => OrderingTerm.asc(c.visOrder)])).get();

    return categoryEntities.map((entity) => entity.toApiModel()).toList();
  }

  // Stream de categorías ordenadas
  Stream<List<ApiModels.ProductCategory>> watchCategoriesOrdered() {
    return (_database.select(_database.productCategories)
      ..orderBy([(c) => OrderingTerm.asc(c.visOrder)])).watch().map(
          (entities) => entities.map((entity) => entity.toApiModel()).toList(),
    );
  }

  // Limpiar todas las categorías
  Future<void> clearAllCategories() async {
    await _database.delete(_database.productCategories).go();
  }

  // Actualizar categoría
  Future<void> updateCategory(ApiModels.ProductCategory category) async {
    final companion = DriftHelpers.productCategoryFromApi(category);
    await (_database.update(_database.productCategories)
      ..where((c) => c.categoryItemCode.equals(category.categoryItemCode)))
        .write(companion);
  }

  // Eliminar categoría por código
  Future<void> deleteCategoryByCode(String categoryCode) async {
    await (_database.delete(_database.productCategories)
      ..where((c) => c.categoryItemCode.equals(categoryCode))).go();
  }
}