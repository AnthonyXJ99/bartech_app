import 'package:bartech_app/data/models/local/product_category_isar.dart';
import 'package:bartech_app/data/models/product_category.dart';
import 'package:isar/isar.dart';

class ProductCategoryIsarRepository {
  final Isar isar;

  ProductCategoryIsarRepository(this.isar);

  // INSERTAR O ACTUALIZAR categorías (bulk)
  Future<void> upsertCategories(List<ProductCategoryIsar> categories) async {
    await isar.writeTxn(() async {
      for (final category in categories) {
        await isar.productCategoryIsars.put(category);
      }
    });
  }

  // INSERTAR O ACTUALIZAR UNA CATEGORÍA
  Future<void> upsertCategory(ProductCategoryIsar category) async {
    await isar.writeTxn(() async {
      await isar.productCategoryIsars.put(category);
    });
  }

  // OBTENER TODAS LAS CATEGORÍAS
  Future<List<ProductCategoryIsar>> getAllCategories() async {
    return await isar.productCategoryIsars.where().findAll();
  }

  // OBTENER CATEGORÍAS ORDENADAS POR visOrder
  Future<List<ProductCategoryIsar>> getAllCategoriesOrdered() async {
    return await isar.productCategoryIsars.where().sortByVisOrder().findAll();
  }

  // OBTENER CATEGORÍA POR ID
  Future<ProductCategoryIsar?> getCategoryById(int id) async {
    return await isar.productCategoryIsars.get(id);
  }

  // OBTENER CATEGORÍA POR categoryItemCode
  Future<ProductCategoryIsar?> getCategoryByCode(
    String categoryItemCode,
  ) async {
    return await isar.productCategoryIsars
        .filter()
        .categoryItemCodeEqualTo(categoryItemCode)
        .findFirst();
  }

  // OBTENER CATEGORÍAS POR GRUPO
  Future<List<ProductCategoryIsar>> getCategoriesByGroup(
    String groupItemCode,
  ) async {
    return await isar.productCategoryIsars
        .filter()
        .groupItemCodeEqualTo(groupItemCode)
        .findAll();
  }

  // OBTENER CATEGORÍAS HABILITADAS
  Future<List<ProductCategoryIsar>> getEnabledCategories() async {
    return await isar.productCategoryIsars
        .filter()
        .enabledEqualTo('Y')
        .findAll();
  }

  // OBTENER CATEGORÍAS HABILITADAS ORDENADAS
  Future<List<ProductCategoryIsar>> getEnabledCategoriesOrdered() async {
    return await isar.productCategoryIsars
        .filter()
        .enabledEqualTo('Y')
        .sortByVisOrder()
        .findAll();
  }

  // BUSCAR CATEGORÍAS POR NOMBRE
  Future<List<ProductCategoryIsar>> searchCategoriesByName(String name) async {
    return await isar.productCategoryIsars
        .filter()
        .categoryItemNameContains(name, caseSensitive: false)
        .findAll();
  }

  // ELIMINAR UNA CATEGORÍA POR ID
  Future<void> deleteCategoryById(int id) async {
    await isar.writeTxn(() async {
      await isar.productCategoryIsars.delete(id);
    });
  }

  // ELIMINAR UNA CATEGORÍA POR categoryItemCode
  Future<void> deleteCategoryByCode(String categoryItemCode) async {
    await isar.writeTxn(() async {
      final category = await getCategoryByCode(categoryItemCode);
      if (category != null) {
        await isar.productCategoryIsars.delete(category.id);
      }
    });
  }

  // ELIMINAR TODAS LAS CATEGORÍAS
  Future<void> clearAllCategories() async {
    await isar.writeTxn(() async {
      await isar.productCategoryIsars.clear();
    });
  }

  // ACTUALIZAR UNA CATEGORÍA
  Future<void> updateCategory(ProductCategoryIsar category) async {
    await isar.writeTxn(() async {
      await isar.productCategoryIsars.put(category);
    });
  }

  // SINCRONIZAR DESDE API (sobreescribe todo)
  Future<void> syncFromApi(List<ProductCategory> apiCategories) async {
    await isar.writeTxn(() async {
      // Limpiar todas las categorías existentes
      await isar.productCategoryIsars.clear();

      // Convertir y guardar las nuevas categorías
      for (final apiCategory in apiCategories) {
        final categoryIsar = ProductCategoryIsar.fromApi(apiCategory);
        await isar.productCategoryIsars.put(categoryIsar);
      }
    });
  }

  // SINCRONIZAR DESDE JSON (sobreescribe todo)
  Future<void> syncFromJson(List<Map<String, dynamic>> jsonCategories) async {
    await isar.writeTxn(() async {
      // Limpiar todas las categorías existentes
      await isar.productCategoryIsars.clear();

      // Convertir y guardar las nuevas categorías
      for (final jsonCategory in jsonCategories) {
        final categoryIsar = ProductCategoryIsar.fromJson(jsonCategory);
        await isar.productCategoryIsars.put(categoryIsar);
      }
    });
  }

  // OBTENER CATEGORÍAS COMO ProductCategory (para compatibilidad)
  Future<List<ProductCategory>> getAllCategoriesAsProductCategory() async {
    final categoriesIsar = await getAllCategories();
    return categoriesIsar.map((c) => c.toProductCategory()).toList();
  }

  // OBTENER CATEGORÍAS HABILITADAS COMO ProductCategory
  Future<List<ProductCategory>> getEnabledCategoriesAsProductCategory() async {
    final categoriesIsar = await getEnabledCategories();
    return categoriesIsar.map((c) => c.toProductCategory()).toList();
  }

  // OBTENER CATEGORÍA POR CÓDIGO COMO ProductCategory
  Future<ProductCategory?> getCategoryByCodeAsProductCategory(
    String categoryItemCode,
  ) async {
    final categoryIsar = await getCategoryByCode(categoryItemCode);
    return categoryIsar?.toProductCategory();
  }

  // VERIFICAR SI EXISTE UNA CATEGORÍA
  Future<bool> categoryExists(String categoryItemCode) async {
    final category = await getCategoryByCode(categoryItemCode);
    return category != null;
  }

  // CONTAR TOTAL DE CATEGORÍAS
  Future<int> getCategoriesCount() async {
    return await isar.productCategoryIsars.count();
  }

  // CONTAR CATEGORÍAS HABILITADAS
  Future<int> getEnabledCategoriesCount() async {
    return await isar.productCategoryIsars.filter().enabledEqualTo('Y').count();
  }
}
