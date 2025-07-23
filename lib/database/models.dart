import 'package:drift/drift.dart';
import '../data/models/product_category.dart' as ApiModels;
import 'database.dart';
// Importa tus modelos existentes
import '../data/models/product.dart' as ApiModels;

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
    );
  }

  Map<String, dynamic> toJson() => {
    'itemCode': itemCode,
    'itemName': itemName,
    'quantity': quantity,
    'imageUrl': imageUrl,
    'isPrimary': isPrimary,
    'productItemCode': productItemCode,
  };
}

extension ProductAccompanimentEntityExtension on ProductAccompanimentEntity {
  // Convertir a tu modelo existente de API
  ApiModels.ProductAccompaniment toApiModel() {
    return ApiModels.ProductAccompaniment(
      itemCode: itemCode,
      itemName: itemName,
      priceOld: priceOld,
      price: price,
      imageUrl: imageUrl,
      productItemCode: productItemCode,
    );
  }

  Map<String, dynamic> toJson() => {
    'itemCode': itemCode,
    'itemName': itemName,
    'priceOld': priceOld,
    'price': price,
    'imageUrl': imageUrl,
    'productItemCode': productItemCode,
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
    );
  }

  static ProductAccompanimentsCompanion productAccompanimentFromJson(Map<String, dynamic> json) {
    return ProductAccompanimentsCompanion(
      itemCode: Value(json['itemCode'] ?? ''),
      itemName: Value(json['itemName']),
      priceOld: Value((json['priceOld'] as num?)?.toDouble() ?? 0),
      price: Value((json['price'] as num?)?.toDouble() ?? 0),
      imageUrl: Value(json['imageUrl']),
      productItemCode: Value(json['productItemCode']),
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
    );
  }

  static ProductAccompanimentsCompanion productAccompanimentFromApi(ApiModels.ProductAccompaniment accompaniment) {
    return ProductAccompanimentsCompanion(
      itemCode: Value(accompaniment.itemCode),
      itemName: Value(accompaniment.itemName),
      priceOld: Value(accompaniment.priceOld),
      price: Value(accompaniment.price),
      imageUrl: Value(accompaniment.imageUrl),
      productItemCode: Value(accompaniment.productItemCode),
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