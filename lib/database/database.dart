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
  TextColumn get isCustomizable => text().nullable()();
}

// Tabla para CategoryAccompaniment (nueva estructura)
@DataClassName('CategoryAccompanimentEntity')
class CategoryAccompaniments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get lineNumber => integer()();
  TextColumn get accompanimentItemCode => text()();
  TextColumn get accompanimentItemName => text()();
  TextColumn get accompanimentImageUrl => text().nullable()();
  RealColumn get accompanimentPrice => real()();
  RealColumn get discount => real()();
  TextColumn get enlargementItemCode => text().nullable()();
  RealColumn get enlargementDiscount => real()();
  TextColumn get categoryItemCode => text().nullable()();
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

class CategoryAccompanimentRelations extends Table {
  IntColumn get categoryId => integer().references(ProductCategories, #id)();
  IntColumn get accompanimentId => integer().references(CategoryAccompaniments, #id)();

  @override
  Set<Column> get primaryKey => {categoryId, accompanimentId};
}

@DriftDatabase(tables: [
  Products,
  ProductMaterials,
  CategoryAccompaniments,
  ProductCategories,
  ProductMaterialRelations,
  CategoryAccompanimentRelations,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

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

  // Métodos para CategoryAccompaniment
  Future<int> insertCategoryAccompaniment(CategoryAccompanimentsCompanion accompaniment) async {
    return await into(categoryAccompaniments).insert(accompaniment);
  }

  Future<List<CategoryAccompanimentEntity>> getAllCategoryAccompaniments() async {
    return await select(categoryAccompaniments).get();
  }

  Stream<List<CategoryAccompanimentEntity>> watchAllCategoryAccompaniments() {
    return select(categoryAccompaniments).watch();
  }

  Future<void> deleteCategoryAccompaniment(int id) async {
    await (delete(categoryAccompaniments)..where((t) => t.id.equals(id))).go();
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

  Future<void> linkCategoryToAccompaniment(int categoryId, int accompanimentId) async {
    await into(categoryAccompanimentRelations).insert(
      CategoryAccompanimentRelationsCompanion(
        categoryId: Value(categoryId),
        accompanimentId: Value(accompanimentId),
      ),
    );
  }

  // Consulta compleja: obtener producto con sus materiales
  Future<Map<String, dynamic>> getProductWithRelations(int productId) async {
    final product = await (select(products)..where((p) => p.id.equals(productId))).getSingle();

    final materials = await (select(productMaterials).join([
      innerJoin(productMaterialRelations, productMaterialRelations.materialId.equalsExp(productMaterials.id))
    ])..where(productMaterialRelations.productId.equals(productId))).get();

    return {
      'product': product,
      'materials': materials.map((row) => row.readTable(productMaterials)).toList(),
    };
  }

  // Consulta compleja: obtener categoría con sus acompañamientos
  Future<Map<String, dynamic>> getCategoryWithAccompaniments(int categoryId) async {
    final category = await (select(productCategories)..where((c) => c.id.equals(categoryId))).getSingle();

    final accompaniments = await (select(categoryAccompaniments).join([
      innerJoin(categoryAccompanimentRelations, categoryAccompanimentRelations.accompanimentId.equalsExp(categoryAccompaniments.id))
    ])..where(categoryAccompanimentRelations.categoryId.equals(categoryId))).get();

    return {
      'category': category,
      'accompaniments': accompaniments.map((row) => row.readTable(categoryAccompaniments)).toList(),
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