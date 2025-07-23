import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

// Tabla para ProductMaterial (renombrada para evitar conflictos)
@DataClassName('ProductMaterialEntity')
class ProductMaterials extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get itemCode => text()();
  TextColumn get itemName => text().nullable()();
  RealColumn get quantity => real()();
  TextColumn get imageUrl => text().nullable()();
  TextColumn get isPrimary => text().nullable()();
  TextColumn get productItemCode => text().nullable()();
}

// Tabla para ProductAccompaniment (renombrada para evitar conflictos)
@DataClassName('ProductAccompanimentEntity')
class ProductAccompaniments extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get itemCode => text()();
  TextColumn get itemName => text().nullable()();
  RealColumn get priceOld => real()();
  RealColumn get price => real()();
  TextColumn get imageUrl => text().nullable()();
  TextColumn get productItemCode => text().nullable()();
}

// Tabla para ProductCategory (renombrada para evitar conflictos)
@DataClassName('ProductCategoryEntity')
class ProductCategories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get categoryItemCode => text()();
  TextColumn get categoryItemName => text()();
  TextColumn get enabled => text()();
  TextColumn get dataSource => text()();
  IntColumn get visOrder => integer()();
  TextColumn get frgnName => text().nullable()();
  TextColumn get imageUrl => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get frgnDescription => text().nullable()();
  TextColumn get groupItemCode => text().nullable()();
}

// Tabla para Product (renombrada para evitar conflictos)
@DataClassName('ProductEntity')
class Products extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get itemCode => text().nullable()();
  TextColumn get itemName => text()();
  RealColumn get price => real()();
  TextColumn get available => text()();
  TextColumn get enabled => text()();
  TextColumn get eanCode => text().nullable()();
  TextColumn get frgnName => text().nullable()();
  RealColumn get discount => real().nullable()();
  TextColumn get imageUrl => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get frgnDescription => text().nullable()();
  TextColumn get sellItem => text().nullable()();
  TextColumn get groupItemCode => text().nullable()();
  TextColumn get categoryItemCode => text().nullable()();
  TextColumn get waitingTime => text().nullable()();
  RealColumn get rating => real().nullable()();
}

// Tablas para las relaciones (many-to-many)
class ProductMaterialRelations extends Table {
  IntColumn get productId => integer().references(Products, #id)();
  IntColumn get materialId => integer().references(ProductMaterials, #id)();

  @override
  Set<Column> get primaryKey => {productId, materialId};
}

class ProductAccompanimentRelations extends Table {
  IntColumn get productId => integer().references(Products, #id)();
  IntColumn get accompanimentId => integer().references(ProductAccompaniments, #id)();

  @override
  Set<Column> get primaryKey => {productId, accompanimentId};
}

@DriftDatabase(tables: [
  Products,
  ProductMaterials,
  ProductAccompaniments,
  ProductCategories,
  ProductMaterialRelations,
  ProductAccompanimentRelations,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Métodos para ProductMaterial
  Future<int> insertProductMaterial(ProductMaterialsCompanion material) async {
    return await into(productMaterials).insert(material);
  }

  Future<List<ProductMaterialEntity>> getAllProductMaterials() async {
    return await select(productMaterials).get();
  }

  Stream<List<ProductMaterialEntity>> watchAllProductMaterials() {
    return select(productMaterials).watch();
  }

  Future<void> deleteProductMaterial(int id) async {
    await (delete(productMaterials)..where((t) => t.id.equals(id))).go();
  }

  // Métodos para ProductAccompaniment
  Future<int> insertProductAccompaniment(ProductAccompanimentsCompanion accompaniment) async {
    return await into(productAccompaniments).insert(accompaniment);
  }

  Future<List<ProductAccompanimentEntity>> getAllProductAccompaniments() async {
    return await select(productAccompaniments).get();
  }

  Stream<List<ProductAccompanimentEntity>> watchAllProductAccompaniments() {
    return select(productAccompaniments).watch();
  }

  Future<void> deleteProductAccompaniment(int id) async {
    await (delete(productAccompaniments)..where((t) => t.id.equals(id))).go();
  }

  // Métodos para ProductCategory
  Future<int> insertProductCategory(ProductCategoriesCompanion category) async {
    return await into(productCategories).insert(category);
  }

  Future<List<ProductCategoryEntity>> getAllProductCategories() async {
    return await select(productCategories).get();
  }

  Stream<List<ProductCategoryEntity>> watchAllProductCategories() {
    return select(productCategories).watch();
  }

  Future<void> deleteProductCategory(int id) async {
    await (delete(productCategories)..where((t) => t.id.equals(id))).go();
  }

  // Métodos para Product
  Future<int> insertProduct(ProductsCompanion product) async {
    return await into(products).insert(product);
  }

  Future<List<ProductEntity>> getAllProducts() async {
    return await select(products).get();
  }

  Stream<List<ProductEntity>> watchAllProducts() {
    return select(products).watch();
  }

  Future<void> deleteProduct(int id) async {
    await (delete(products)..where((t) => t.id.equals(id))).go();
  }

  // Métodos para relaciones
  Future<void> linkProductToMaterial(int productId, int materialId) async {
    await into(productMaterialRelations).insert(
      ProductMaterialRelationsCompanion(
        productId: Value(productId),
        materialId: Value(materialId),
      ),
    );
  }

  Future<void> linkProductToAccompaniment(int productId, int accompanimentId) async {
    await into(productAccompanimentRelations).insert(
      ProductAccompanimentRelationsCompanion(
        productId: Value(productId),
        accompanimentId: Value(accompanimentId),
      ),
    );
  }

  // Consulta compleja: obtener producto con sus materiales y acompañamientos
  Future<Map<String, dynamic>> getProductWithRelations(int productId) async {
    final product = await (select(products)..where((p) => p.id.equals(productId))).getSingle();

    final materials = await (select(productMaterials).join([
      innerJoin(productMaterialRelations, productMaterialRelations.materialId.equalsExp(productMaterials.id))
    ])..where(productMaterialRelations.productId.equals(productId))).get();

    final accompaniments = await (select(productAccompaniments).join([
      innerJoin(productAccompanimentRelations, productAccompanimentRelations.accompanimentId.equalsExp(productAccompaniments.id))
    ])..where(productAccompanimentRelations.productId.equals(productId))).get();

    return {
      'product': product,
      'materials': materials.map((row) => row.readTable(productMaterials)).toList(),
      'accompaniments': accompaniments.map((row) => row.readTable(productAccompaniments)).toList(),
    };
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'bartech_app.sqlite'));
    return NativeDatabase(file);
  });
}