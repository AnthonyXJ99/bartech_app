import 'package:dio/dio.dart';
import '../models/product.dart';

class ProductsService {
  final Dio _dio;
  ProductsService(this._dio);

  // GET /api/Products/all
  Future<List<Product>> getAll() async {
    final res = await _dio.get('/api/Products/all');
    return (res.data as List).map((e) => Product.fromJson(e)).toList();
  }

  // GET /api/Products?pageNumber=1&pageSize=10&search=...
  Future<List<Product>> getPaged({
    int pageNumber = 1,
    int pageSize = 10,
    String? search,
  }) async {
    final res = await _dio.get(
      '/api/Products',
      queryParameters: {
        'pageNumber': pageNumber,
        'pageSize': pageSize,
        if (search != null && search.isNotEmpty) 'search': search,
      },
    );
    final data = res.data['data'] as List;
    return data.map((e) => Product.fromJson(e)).toList();
  }

  // GET /api/Products/{productCode}
  Future<Product> getByCode(String code) async {
    final res = await _dio.get('/api/Products/$code');
    return Product.fromJson(res.data);
  }

  // POST /api/Products
  Future<Product> create(Product product) async {
    final res = await _dio.post('/api/Products', data: product.toJson());
    return Product.fromJson(res.data);
  }

  // PUT /api/Products/{productCode}
  Future<void> update(String code, Product product) async {
    await _dio.put('/api/Products/$code', data: product.toJson());
  }

  // DELETE /api/Products/{productCode}
  Future<void> delete(String code) async {
    await _dio.delete('/api/Products/$code');
  }

  // GET /api/Products/Groups/{groupCode}
  Future<List<Product>> getByGroup(String groupCode) async {
    final res = await _dio.get('/api/Products/Groups/$groupCode');
    return (res.data as List).map((e) => Product.fromJson(e)).toList();
  }

  // GET /api/Products/Categories/{categoryCode}
  Future<List<Product>> getByCategory(String categoryCode) async {
    final res = await _dio.get('/api/Products/Categories/$categoryCode');
    return (res.data as List).map((e) => Product.fromJson(e)).toList();
  }
}
