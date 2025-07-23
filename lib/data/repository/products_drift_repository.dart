import 'package:bartech_app/data/models/local/product_accompaniment_isar.dart';
import 'package:bartech_app/data/models/local/product_isar.dart';
import 'package:bartech_app/data/models/local/product_material_isar.dart';
import 'package:isar/isar.dart';

class ProductsIsarRepository {
  final Isar isar;

  ProductsIsarRepository(this.isar);

  // INSERTAR O ACTUALIZAR productos (bulk)
  Future<void> upsertProducts(List<ProductIsar> products) async {
    await isar.writeTxn(() async {
      for (final product in products) {
        // Primero, guarda los materiales y acompañamientos y obtén sus IDs
        final materialIds = <Id>[];
        for (final m in product.material) {
          final id = await isar.productMaterialISars.put(m);
          materialIds.add(id);
        }

        final accompanimentIds = <Id>[];
        for (final a in product.accompaniment) {
          final id = await isar.productAccompanimentIsars.put(a);
          accompanimentIds.add(id);
        }

        // Guarda el producto
        await isar.productIsars.put(product);

        // Enlaza los materiales y acompañamientos al producto
        product.material.clear();
        product.accompaniment.clear();

        // Busca las instancias recién insertadas y agrégalas al Link
        final materialObjs = await isar.productMaterialISars.getAll(
          materialIds,
        );
        product.material.addAll(materialObjs.whereType<ProductMaterialISar>());
        await product.material.save();

        final accompanimentObjs = await isar.productAccompanimentIsars.getAll(
          accompanimentIds,
        );
        product.accompaniment.addAll(
          accompanimentObjs.whereType<ProductAccompanimentIsar>(),
        );
        await product.accompaniment.save();
      }
    });
  }

  // OBTENER TODOS LOS PRODUCTOS
  Future<List<ProductIsar>> getAllProducts() async {
    return await isar.productIsars.where().findAll();
  }

  // OBTENER PRODUCTO POR ID
  Future<ProductIsar?> getProductById(int id) async {
    return await isar.productIsars.get(id);
  }

  // OBTENER PRODUCTO POR itemCode
  Future<ProductIsar?> getProductByItemCode(String itemCode) async {
    return await isar.productIsars
        .filter()
        .itemCodeEqualTo(itemCode)
        .findFirst();
  }

  // OBTENER PRODUCTOS POR CATEGORÍA
  Future<List<ProductIsar>> getProductsByCategory(String categoryCode) async {
    return await isar.productIsars
        .filter()
        .categoryItemCodeEqualTo(categoryCode)
        .findAll();
  }

  // OBTENER PRODUCTOS POR GRUPO
  Future<List<ProductIsar>> getProductsByGroup(String groupCode) async {
    return await isar.productIsars
        .filter()
        .groupItemCodeEqualTo(groupCode)
        .findAll();
  }

  // ELIMINAR UN PRODUCTO POR ID
  Future<void> deleteProductById(int id) async {
    await isar.writeTxn(() async {
      await isar.productIsars.delete(id);
    });
  }

  // ELIMINAR TODOS LOS PRODUCTOS
  Future<void> clearAllProducts() async {
    await isar.writeTxn(() async {
      await isar.productIsars.clear();
      await isar.productMaterialISars.clear();
      await isar.productAccompanimentIsars.clear();
    });
  }

  // ACTUALIZAR UN PRODUCTO
  Future<void> updateProduct(ProductIsar product) async {
    await isar.writeTxn(() async {
      await isar.productIsars.put(product);
      await product.material.save();
      await product.accompaniment.save();
    });
  }

  // SINCRONIZAR DESDE API (sobreescribe todo)
  Future<void> syncFromApi(List<ProductIsar> apiProducts) async {
    await clearAllProducts();
    await upsertProducts(apiProducts);
  }
}
