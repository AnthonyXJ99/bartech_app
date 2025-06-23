import '../models/product_group.dart';
import '../services/product_groups_service.dart';

class ProductGroupsRepository {
  final ProductGroupsService _service;
  ProductGroupsRepository(this._service);

  Future<List<ProductGroup>> getAllGroups() => _service.getAll();

  Future<List<ProductGroup>> getGroupsPaged({
    int pageNumber = 1,
    int pageSize = 10,
    String? search,
  }) => _service.getPaged(
    pageNumber: pageNumber,
    pageSize: pageSize,
    search: search,
  );

  Future<ProductGroup> getGroupByCode(String code) => _service.getByCode(code);

  Future<ProductGroup> createGroup(ProductGroup group) =>
      _service.create(group);

  Future<void> updateGroup(String code, ProductGroup group) =>
      _service.update(code, group);

  Future<void> deleteGroup(String code) => _service.delete(code);
}
