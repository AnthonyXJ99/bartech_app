import 'package:dio/dio.dart';
import '../models/product_category.dart';

class ProductCategoriesService {
  final Dio _dio;
  ProductCategoriesService(this._dio);

  // GET /api/ProductCategories/all
  Future<List<ProductCategory>> getAll() async {
    final res = await _dio.get('/api/ProductCategories/all');
    return (res.data as List).map((e) => ProductCategory.fromJson(e)).toList();
  }

  // GET /api/ProductCategories?pageNumber=1&pageSize=10&search=...
  Future<List<ProductCategory>> getPaged({
    int pageNumber = 1,
    int pageSize = 10,
    String? search,
  }) async {
    final res = await _dio.get(
      '/api/ProductCategories',
      queryParameters: {
        'pageNumber': pageNumber,
        'pageSize': pageSize,
        if (search != null && search.isNotEmpty) 'search': search,
      },
    );
    final data = res.data['data'] as List;
    return data.map((e) => ProductCategory.fromJson(e)).toList();
  }

  // GET /api/ProductCategories/{categoryCode}
  Future<ProductCategory> getByCode(String code) async {
    final res = await _dio.get('/api/ProductCategories/$code');
    return ProductCategory.fromJson(res.data);
  }

  // POST /api/ProductCategories
  Future<ProductCategory> create(ProductCategory category) async {
    final res = await _dio.post(
      '/api/ProductCategories',
      data: category.toJson(),
    );
    return ProductCategory.fromJson(res.data);
  }

  // PUT /api/ProductCategories/{categoryCode}
  Future<void> update(String code, ProductCategory category) async {
    await _dio.put('/api/ProductCategories/$code', data: category.toJson());
  }

  // DELETE /api/ProductCategories/{categoryCode}
  Future<void> delete(String code) async {
    await _dio.delete('/api/ProductCategories/$code');
  }

  // GET /api/ProductCategories/Groups/{groupCode}
  Future<List<ProductCategory>> getByGroup(String groupCode) async {
    final res = await _dio.get('/api/ProductCategories/Groups/$groupCode');
    return (res.data as List).map((e) => ProductCategory.fromJson(e)).toList();
  }

  // GET /api/ProductCategories/with-accompaniments
  Future<List<ProductCategory>> getAllWithAccompaniments() async {
    final res = await _dio.get('/api/ProductCategories/with-accompaniments');
    return (res.data as List).map((e) => ProductCategory.fromJson(e)).toList();
  }
}
