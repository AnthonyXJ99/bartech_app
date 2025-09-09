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
        for (final material in product.material ?? []) {
          final materialCompanion = DriftHelpers.productMaterialFromApi(material);
          final materialId = await _database.insertProductMaterial(materialCompanion);
          await _database.linkProductToMaterial(productId, materialId);
        }

        // Los acompañamientos ahora están en las categorías, no en productos individuales
      }
    });
  }

  // Obtener todos los productos
  Future<List<ApiModels.Product>> getAllProducts() async {
    final productEntities = await _database.getAllProducts();

    // Convertir entidades a modelos de API
    List<ApiModels.Product> products = [];

    for (final productEntity in productEntities) {
      // Obtener relaciones del producto (solo materiales)
      final relations = await _database.getProductWithRelations(productEntity.id);
      final materialEntities = relations['materials'] as List<ProductMaterialEntity>;

      // Convertir a modelo de API (sin acompañamientos)
      final product = productEntity.toApiModel(
        materials: materialEntities.map((e) => e.toApiModel()).toList(),
        accompaniments: [], // Los acompañamientos están en las categorías
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
          // Obtener relaciones del producto (solo materiales)
          final relations = await _database.getProductWithRelations(productEntity.id);
          final materialEntities = relations['materials'] as List<ProductMaterialEntity>;

          // Convertir a modelo de API (sin acompañamientos)
          final product = productEntity.toApiModel(
            materials: materialEntities.map((e) => e.toApiModel()).toList(),
            accompaniments: [], // Los acompañamientos están en las categorías
          );

          products.add(product);
        } catch (e) {
          // Si hay error obteniendo relaciones, crear producto solo con materiales vacíos
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

      // Luego limpiar tablas principales
      await _database.delete(_database.productMaterials).go();
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

      return productEntity.toApiModel(
        materials: materialEntities.map((e) => e.toApiModel()).toList(),
        accompaniments: [], // Los acompañamientos están en las categorías
      );
    } catch (e) {
      return null;
    }
  }
}