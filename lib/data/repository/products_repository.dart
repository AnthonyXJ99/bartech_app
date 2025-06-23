import '../models/product.dart';
import '../services/products_service.dart';

class ProductsRepository {
  final ProductsService _service;
  ProductsRepository(this._service);

  Future<List<Product>> getAllProducts() => _service.getAll();

  Future<List<Product>> getProductsPaged({
    int pageNumber = 1,
    int pageSize = 10,
    String? search,
  }) => _service.getPaged(
    pageNumber: pageNumber,
    pageSize: pageSize,
    search: search,
  );

  Future<Product> getProductByCode(String code) => _service.getByCode(code);

  Future<Product> createProduct(Product product) => _service.create(product);

  Future<void> updateProduct(String code, Product product) =>
      _service.update(code, product);

  Future<void> deleteProduct(String code) => _service.delete(code);

  Future<List<Product>> getProductsByGroup(String groupCode) =>
      _service.getByGroup(groupCode);

  Future<List<Product>> getProductsByCategory(String categoryCode) =>
      _service.getByCategory(categoryCode);
}
