import 'package:bartech_app/data/models/product_category.dart';
import 'package:isar/isar.dart';

part 'product_category_isar.g.dart';

@collection
class ProductCategoryIsar {
  Id id = Isar.autoIncrement; // Campo obligatorio para Isar

  late String categoryItemCode;
  late String categoryItemName;
  late String enabled;
  late String dataSource;
  late int visOrder;
  String? frgnName;
  String? imageUrl;
  String? description;
  String? frgnDescription;
  String? groupItemCode;

  ProductCategoryIsar();

  // Factory para convertir desde el modelo de API
  factory ProductCategoryIsar.fromApi(ProductCategory category) {
    final c = ProductCategoryIsar();
    c.categoryItemCode = category.categoryItemCode;
    c.categoryItemName = category.categoryItemName;
    c.enabled = category.enabled;
    c.dataSource = category.dataSource;
    c.visOrder = category.visOrder;
    c.frgnName = category.frgnName;
    c.imageUrl = category.imageUrl;
    c.description = category.description;
    c.frgnDescription = category.frgnDescription;
    c.groupItemCode = category.groupItemCode;
    return c;
  }

  // Método para convertir a ProductCategory
  ProductCategory toProductCategory() {
    return ProductCategory(
      categoryItemCode: categoryItemCode,
      categoryItemName: categoryItemName,
      enabled: enabled,
      dataSource: dataSource,
      visOrder: visOrder,
      frgnName: frgnName,
      imageUrl: imageUrl,
      description: description,
      frgnDescription: frgnDescription,
      groupItemCode: groupItemCode,
    );
  }

  // Método para convertir desde JSON
  factory ProductCategoryIsar.fromJson(Map<String, dynamic> json) {
    final c = ProductCategoryIsar();
    c.categoryItemCode = json['categoryItemCode'] ?? '';
    c.categoryItemName = json['categoryItemName'] ?? '';
    c.enabled = json['enabled'] ?? '';
    c.dataSource = json['dataSource'] ?? '';
    c.visOrder = json['visOrder'] ?? 0;
    c.frgnName = json['frgnName'];
    c.imageUrl = json['imageUrl'];
    c.description = json['description'];
    c.frgnDescription = json['frgnDescription'];
    c.groupItemCode = json['groupItemCode'];
    return c;
  }

  // Método para convertir a JSON
  Map<String, dynamic> toJson() {
    return {
      'categoryItemCode': categoryItemCode,
      'categoryItemName': categoryItemName,
      'enabled': enabled,
      'dataSource': dataSource,
      'visOrder': visOrder,
      'frgnName': frgnName,
      'imageUrl': imageUrl,
      'description': description,
      'frgnDescription': frgnDescription,
      'groupItemCode': groupItemCode,
    };
  }
}
