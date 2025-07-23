import 'package:bartech_app/database/database.dart';
import 'package:bartech_app/database/models.dart';
import 'package:bartech_app/data/models/product.dart' as ApiModels;

class ProductsDriftRepository {
  final AppDatabase _database;

  ProductsDriftRepository(this._database);

  // Insertar productos desde API
  Future<void> insertProducts(List<ApiModels.Product> products) async {
    await _database.transaction(() async {
      for (final product in products) {
        // Insertar producto principal
        final productCompanion = DriftHelpers.productFromApi(product);
        final productId = await _database.insertProduct(productCompanion);

        // Insertar materiales y crear relaciones
        for (final material in product.material!) {
          final materialCompanion = DriftHelpers.productMaterialFromApi(material);
          final materialId = await _database.insertProductMaterial(materialCompanion);
          await _database.linkProductToMaterial(productId, materialId);
        }

        // Insertar acompañamientos y crear relaciones
        for (final accompaniment in product.accompaniment!) {
          final accompanimentCompanion = DriftHelpers.productAccompanimentFromApi(accompaniment);
          final accompanimentId = await _database.insertProductAccompaniment(accompanimentCompanion);
          await _database.linkProductToAccompaniment(productId, accompanimentId);
        }
      }
    });
  }

  // Obtener todos los productos
  Future<List<ApiModels.Product>> getAllProducts() async {
    final productEntities = await _database.getAllProducts();

    // Convertir entidades a modelos de API
    List<ApiModels.Product> products = [];

    for (final productEntity in productEntities) {
      // Obtener relaciones del producto
      final relations = await _database.getProductWithRelations(productEntity.id);
      final materialEntities = relations['materials'] as List<ProductMaterialEntity>;
      final accompanimentEntities = relations['accompaniments'] as List<ProductAccompanimentEntity>;

      // Convertir a modelo de API
      final product = productEntity.toApiModel(
        materials: materialEntities.map((e) => e.toApiModel()).toList(),
        accompaniments: accompanimentEntities.map((e) => e.toApiModel()).toList(),
      );

      products.add(product);
    }

    return products;
  }

  // Stream reactivo de productos
  Stream<List<ApiModels.Product>> watchAllProducts() {
    return _database.watchAllProducts().asyncMap((productEntities) async {
      List<ApiModels.Product> products = [];

      for (final productEntity in productEntities) {
        try {
          // Obtener relaciones del producto
          final relations = await _database.getProductWithRelations(productEntity.id);
          final materialEntities = relations['materials'] as List<ProductMaterialEntity>;
          final accompanimentEntities = relations['accompaniments'] as List<ProductAccompanimentEntity>;

          // Convertir a modelo de API
          final product = productEntity.toApiModel(
            materials: materialEntities.map((e) => e.toApiModel()).toList(),
            accompaniments: accompanimentEntities.map((e) => e.toApiModel()).toList(),
          );

          products.add(product);
        } catch (e) {
          // Si hay error obteniendo relaciones, crear producto sin relaciones
          final product = productEntity.toApiModel(materials: [], accompaniments: []);
          products.add(product);
        }
      }

      return products;
    });
  }

  // Obtener productos por categoría
  Future<List<ApiModels.Product>> getProductsByCategory(String categoryCode) async {
    final allProducts = await getAllProducts();
    return allProducts.where((product) => product.categoryItemCode == categoryCode).toList();
  }

  // Buscar productos
  Future<List<ApiModels.Product>> searchProducts(String query) async {
    final allProducts = await getAllProducts();
    return allProducts.where((product) =>
    product.itemName.toLowerCase().contains(query.toLowerCase()) ||
        (product.description?.toLowerCase().contains(query.toLowerCase()) ?? false)
    ).toList();
  }

  // Limpiar todos los productos
  Future<void> clearAllProducts() async {
    await _database.transaction(() async {
      // Limpiar relaciones primero
      await _database.delete(_database.productMaterialRelations).go();
      await _database.delete(_database.productAccompanimentRelations).go();

      // Luego limpiar tablas principales
      await _database.delete(_database.productMaterials).go();
      await _database.delete(_database.productAccompaniments).go();
      await _database.delete(_database.products).go();
    });
  }

  // Obtener producto específico por itemCode
  Future<ApiModels.Product?> getProductByItemCode(String itemCode) async {
    try {
      final productEntity = await (_database.select(_database.products)
        ..where((p) => p.itemCode.equals(itemCode))).getSingle();

      final relations = await _database.getProductWithRelations(productEntity.id);
      final materialEntities = relations['materials'] as List<ProductMaterialEntity>;
      final accompanimentEntities = relations['accompaniments'] as List<ProductAccompanimentEntity>;

      return productEntity.toApiModel(
        materials: materialEntities.map((e) => e.toApiModel()).toList(),
        accompaniments: accompanimentEntities.map((e) => e.toApiModel()).toList(),
      );
    } catch (e) {
      return null;
    }
  }
}