import 'package:dio/dio.dart';
import '../models/product_group.dart';

class ProductGroupsService {
  final Dio _dio;
  ProductGroupsService(this._dio);

  // GET /api/ProductGroups/all
  Future<List<ProductGroup>> getAll() async {
    final res = await _dio.get('/api/ProductGroups/all');
    return (res.data as List).map((e) => ProductGroup.fromJson(e)).toList();
  }

  // GET /api/ProductGroups?pageNumber=1&pageSize=10&search=...
  Future<List<ProductGroup>> getPaged({
    int pageNumber = 1,
    int pageSize = 10,
    String? search,
  }) async {
    final res = await _dio.get(
      '/api/ProductGroups',
      queryParameters: {
        'pageNumber': pageNumber,
        'pageSize': pageSize,
        if (search != null && search.isNotEmpty) 'search': search,
      },
    );
    final data = res.data['data'] as List;
    return data.map((e) => ProductGroup.fromJson(e)).toList();
  }

  // GET /api/ProductGroups/{groupCode}
  Future<ProductGroup> getByCode(String code) async {
    final res = await _dio.get('/api/ProductGroups/$code');
    return ProductGroup.fromJson(res.data);
  }

  // POST /api/ProductGroups
  Future<ProductGroup> create(ProductGroup group) async {
    final res = await _dio.post('/api/ProductGroups', data: group.toJson());
    return ProductGroup.fromJson(res.data);
  }

  // PUT /api/ProductGroups/{groupCode}
  Future<void> update(String code, ProductGroup group) async {
    await _dio.put('/api/ProductGroups/$code', data: group.toJson());
  }

  // DELETE /api/ProductGroups/{groupCode}
  Future<void> delete(String code) async {
    await _dio.delete('/api/ProductGroups/$code');
  }
}
