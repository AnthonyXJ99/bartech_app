import 'package:drift/drift.dart';
import '../data/models/product_category.dart' as ApiModels;
import 'database.dart';
// Importa tus modelos existentes
import '../data/models/product.dart' as ApiModels;
import '../data/models/category_accompaniment.dart' as ApiModels;

// Extensiones para facilitar la conversión desde las entidades de Drift a tus modelos existentes
extension ProductMaterialEntityExtension on ProductMaterialEntity {
  // Convertir a tu modelo existente de API
  ApiModels.ProductMaterial toApiModel() {
    return ApiModels.ProductMaterial(
      itemCode: itemCode,
      itemName: itemName,
      quantity: quantity,
      imageUrl: imageUrl,
      isPrimary: isPrimary,
      productItemCode: productItemCode,
      isCustomizable: isCustomizable,
    );
  }

  Map<String, dynamic> toJson() => {
    'itemCode': itemCode,
    'itemName': itemName,
    'quantity': quantity,
    'imageUrl': imageUrl,
    'isPrimary': isPrimary,
    'productItemCode': productItemCode,
    'isCustomizable': isCustomizable,
  };
}

extension CategoryAccompanimentEntityExtension on CategoryAccompanimentEntity {
  // Convertir a tu modelo existente de API
  ApiModels.CategoryAccompaniment toApiModel() {
    return ApiModels.CategoryAccompaniment(
      lineNumber: lineNumber,
      accompanimentItemCode: accompanimentItemCode,
      accompanimentItemName: accompanimentItemName,
      accompanimentImageUrl: accompanimentImageUrl,
      accompanimentPrice: accompanimentPrice,
      discount: discount,
      enlargementItemCode: enlargementItemCode,
      enlargementDiscount: enlargementDiscount,
    );
  }

  Map<String, dynamic> toJson() => {
    'lineNumber': lineNumber,
    'accompanimentItemCode': accompanimentItemCode,
    'accompanimentItemName': accompanimentItemName,
    'accompanimentImageUrl': accompanimentImageUrl,
    'accompanimentPrice': accompanimentPrice,
    'discount': discount,
    'enlargementItemCode': enlargementItemCode,
    'enlargementDiscount': enlargementDiscount,
  };
}

extension ProductCategoryEntityExtension on ProductCategoryEntity {
  // Convertir a tu modelo existente de API
  ApiModels.ProductCategory toApiModel() {
    return ApiModels.ProductCategory(
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

  Map<String, dynamic> toJson() => {
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

extension ProductEntityExtension on ProductEntity {
  // Convertir a tu modelo existente de API
  ApiModels.Product toApiModel({
    List<ApiModels.ProductMaterial>? materials,
    List<ApiModels.ProductAccompaniment>? accompaniments,
  }) {
    return ApiModels.Product(
      itemCode: itemCode,
      itemName: itemName,
      price: price,
      available: available,
      enabled: enabled,
      eanCode: eanCode,
      frgnName: frgnName,
      discount: discount,
      imageUrl: imageUrl,
      description: description,
      frgnDescription: frgnDescription,
      sellItem: sellItem,
      groupItemCode: groupItemCode,
      categoryItemCode: categoryItemCode,
      waitingTime: waitingTime,
      rating: rating,
      material: materials ?? [],
      accompaniment: accompaniments ?? [],
    );
  }

  Map<String, dynamic> toJson() => {
    'itemCode': itemCode,
    'itemName': itemName,
    'price': price,
    'available': available,
    'enabled': enabled,
    'eanCode': eanCode,
    'frgnName': frgnName,
    'discount': discount,
    'imageUrl': imageUrl,
    'description': description,
    'frgnDescription': frgnDescription,
    'sellItem': sellItem,
    'groupItemCode': groupItemCode,
    'categoryItemCode': categoryItemCode,
    'waitingTime': waitingTime,
    'rating': rating,
  };
}

// Helpers para crear Companions desde JSON o tus modelos de API existentes
class DriftHelpers {
  // Desde JSON
  static ProductMaterialsCompanion productMaterialFromJson(Map<String, dynamic> json) {
    return ProductMaterialsCompanion(
      itemCode: Value(json['itemCode'] ?? ''),
      itemName: Value(json['itemName']),
      quantity: Value((json['quantity'] as num?)?.toDouble() ?? 0),
      imageUrl: Value(json['imageUrl']),
      isPrimary: Value(json['isPrimary']),
      productItemCode: Value(json['productItemCode']),
      isCustomizable: Value(json['isCustomizable']),
    );
  }

  static CategoryAccompanimentsCompanion categoryAccompanimentFromJson(Map<String, dynamic> json) {
    return CategoryAccompanimentsCompanion(
      lineNumber: Value(json['lineNumber'] ?? 0),
      accompanimentItemCode: Value(json['accompanimentItemCode'] ?? ''),
      accompanimentItemName: Value(json['accompanimentItemName'] ?? ''),
      accompanimentImageUrl: Value(json['accompanimentImageUrl']),
      accompanimentPrice: Value((json['accompanimentPrice'] as num?)?.toDouble() ?? 0),
      discount: Value((json['discount'] as num?)?.toDouble() ?? 0),
      enlargementItemCode: Value(json['enlargementItemCode']),
      enlargementDiscount: Value((json['enlargementDiscount'] as num?)?.toDouble() ?? 0),
      categoryItemCode: Value(json['categoryItemCode']),
    );
  }

  static ProductCategoriesCompanion productCategoryFromJson(Map<String, dynamic> json) {
    return ProductCategoriesCompanion(
      categoryItemCode: Value(json['categoryItemCode'] ?? ''),
      categoryItemName: Value(json['categoryItemName'] ?? ''),
      enabled: Value(json['enabled'] ?? ''),
      dataSource: Value(json['dataSource'] ?? ''),
      visOrder: Value(json['visOrder'] ?? 0),
      frgnName: Value(json['frgnName']),
      imageUrl: Value(json['imageUrl']),
      description: Value(json['description']),
      frgnDescription: Value(json['frgnDescription']),
      groupItemCode: Value(json['groupItemCode']),
    );
  }

  static ProductsCompanion productFromJson(Map<String, dynamic> json) {
    return ProductsCompanion(
      itemCode: Value(json['itemCode']),
      itemName: Value(json['itemName'] ?? ''),
      price: Value((json['price'] as num?)?.toDouble() ?? 0),
      available: Value(json['available'] ?? ''),
      enabled: Value(json['enabled'] ?? ''),
      eanCode: Value(json['eanCode']),
      frgnName: Value(json['frgnName']),
      discount: Value((json['discount'] as num?)?.toDouble()),
      imageUrl: Value(json['imageUrl']),
      description: Value(json['description']),
      frgnDescription: Value(json['frgnDescription']),
      sellItem: Value(json['sellItem']),
      groupItemCode: Value(json['groupItemCode']),
      categoryItemCode: Value(json['categoryItemCode']),
      waitingTime: Value(json['waitingTime']),
      rating: Value((json['rating'] as num?)?.toDouble()),
    );
  }

  // Desde tus modelos de API existentes
  static ProductMaterialsCompanion productMaterialFromApi(ApiModels.ProductMaterial material) {
    return ProductMaterialsCompanion(
      itemCode: Value(material.itemCode),
      itemName: Value(material.itemName),
      quantity: Value(material.quantity),
      imageUrl: Value(material.imageUrl),
      isPrimary: Value(material.isPrimary),
      productItemCode: Value(material.productItemCode),
      isCustomizable: Value(material.isCustomizable),
    );
  }

  static CategoryAccompanimentsCompanion categoryAccompanimentFromApi(ApiModels.CategoryAccompaniment accompaniment) {
    return CategoryAccompanimentsCompanion(
      lineNumber: Value(accompaniment.lineNumber),
      accompanimentItemCode: Value(accompaniment.accompanimentItemCode),
      accompanimentItemName: Value(accompaniment.accompanimentItemName),
      accompanimentImageUrl: Value(accompaniment.accompanimentImageUrl),
      accompanimentPrice: Value(accompaniment.accompanimentPrice),
      discount: Value(accompaniment.discount),
      enlargementItemCode: Value(accompaniment.enlargementItemCode),
      enlargementDiscount: Value(accompaniment.enlargementDiscount),
      categoryItemCode: Value(null), // Se asigna en el repositorio
    );
  }

  static ProductCategoriesCompanion productCategoryFromApi(ApiModels.ProductCategory category) {
    return ProductCategoriesCompanion(
      categoryItemCode: Value(category.categoryItemCode),
      categoryItemName: Value(category.categoryItemName),
      enabled: Value(category.enabled),
      dataSource: Value(category.dataSource),
      visOrder: Value(category.visOrder),
      frgnName: Value(category.frgnName),
      imageUrl: Value(category.imageUrl),
      description: Value(category.description),
      frgnDescription: Value(category.frgnDescription),
      groupItemCode: Value(category.groupItemCode),
    );
  }

  static ProductsCompanion productFromApi(ApiModels.Product product) {
    return ProductsCompanion(
      itemCode: Value(product.itemCode),
      itemName: Value(product.itemName),
      price: Value(product.price),
      available: Value(product.available),
      enabled: Value(product.enabled),
      eanCode: Value(product.eanCode),
      frgnName: Value(product.frgnName),
      discount: Value(product.discount),
      imageUrl: Value(product.imageUrl),
      description: Value(product.description),
      frgnDescription: Value(product.frgnDescription),
      sellItem: Value(product.sellItem),
      groupItemCode: Value(product.groupItemCode),
      categoryItemCode: Value(product.categoryItemCode),
      waitingTime: Value(product.waitingTime),
      rating: Value(product.rating),
    );
  }
}