// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProductCategoryIsarCollection on Isar {
  IsarCollection<ProductCategoryIsar> get productCategoryIsars =>
      this.collection();
}

const ProductCategoryIsarSchema = CollectionSchema(
  name: r'ProductCategoryIsar',
  id: -3705157186811377055,
  properties: {
    r'categoryItemCode': PropertySchema(
      id: 0,
      name: r'categoryItemCode',
      type: IsarType.string,
    ),
    r'categoryItemName': PropertySchema(
      id: 1,
      name: r'categoryItemName',
      type: IsarType.string,
    ),
    r'dataSource': PropertySchema(
      id: 2,
      name: r'dataSource',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 3,
      name: r'description',
      type: IsarType.string,
    ),
    r'enabled': PropertySchema(
      id: 4,
      name: r'enabled',
      type: IsarType.string,
    ),
    r'frgnDescription': PropertySchema(
      id: 5,
      name: r'frgnDescription',
      type: IsarType.string,
    ),
    r'frgnName': PropertySchema(
      id: 6,
      name: r'frgnName',
      type: IsarType.string,
    ),
    r'groupItemCode': PropertySchema(
      id: 7,
      name: r'groupItemCode',
      type: IsarType.string,
    ),
    r'imageUrl': PropertySchema(
      id: 8,
      name: r'imageUrl',
      type: IsarType.string,
    ),
    r'visOrder': PropertySchema(
      id: 9,
      name: r'visOrder',
      type: IsarType.long,
    )
  },
  estimateSize: _productCategoryIsarEstimateSize,
  serialize: _productCategoryIsarSerialize,
  deserialize: _productCategoryIsarDeserialize,
  deserializeProp: _productCategoryIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _productCategoryIsarGetId,
  getLinks: _productCategoryIsarGetLinks,
  attach: _productCategoryIsarAttach,
  version: '3.1.0+1',
);

int _productCategoryIsarEstimateSize(
  ProductCategoryIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.categoryItemCode.length * 3;
  bytesCount += 3 + object.categoryItemName.length * 3;
  bytesCount += 3 + object.dataSource.length * 3;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.enabled.length * 3;
  {
    final value = object.frgnDescription;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.frgnName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.groupItemCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.imageUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _productCategoryIsarSerialize(
  ProductCategoryIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.categoryItemCode);
  writer.writeString(offsets[1], object.categoryItemName);
  writer.writeString(offsets[2], object.dataSource);
  writer.writeString(offsets[3], object.description);
  writer.writeString(offsets[4], object.enabled);
  writer.writeString(offsets[5], object.frgnDescription);
  writer.writeString(offsets[6], object.frgnName);
  writer.writeString(offsets[7], object.groupItemCode);
  writer.writeString(offsets[8], object.imageUrl);
  writer.writeLong(offsets[9], object.visOrder);
}

ProductCategoryIsar _productCategoryIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProductCategoryIsar();
  object.categoryItemCode = reader.readString(offsets[0]);
  object.categoryItemName = reader.readString(offsets[1]);
  object.dataSource = reader.readString(offsets[2]);
  object.description = reader.readStringOrNull(offsets[3]);
  object.enabled = reader.readString(offsets[4]);
  object.frgnDescription = reader.readStringOrNull(offsets[5]);
  object.frgnName = reader.readStringOrNull(offsets[6]);
  object.groupItemCode = reader.readStringOrNull(offsets[7]);
  object.id = id;
  object.imageUrl = reader.readStringOrNull(offsets[8]);
  object.visOrder = reader.readLong(offsets[9]);
  return object;
}

P _productCategoryIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _productCategoryIsarGetId(ProductCategoryIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _productCategoryIsarGetLinks(
    ProductCategoryIsar object) {
  return [];
}

void _productCategoryIsarAttach(
    IsarCollection<dynamic> col, Id id, ProductCategoryIsar object) {
  object.id = id;
}

extension ProductCategoryIsarQueryWhereSort
    on QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QWhere> {
  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProductCategoryIsarQueryWhere
    on QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QWhereClause> {
  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ProductCategoryIsarQueryFilter on QueryBuilder<ProductCategoryIsar,
    ProductCategoryIsar, QFilterCondition> {
  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      categoryItemCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryItemCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      categoryItemCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categoryItemCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      categoryItemCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categoryItemCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      categoryItemCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categoryItemCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      categoryItemCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'categoryItemCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      categoryItemCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'categoryItemCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      categoryItemCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categoryItemCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      categoryItemCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categoryItemCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      categoryItemCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryItemCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      categoryItemCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categoryItemCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      categoryItemNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryItemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      categoryItemNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categoryItemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      categoryItemNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categoryItemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      categoryItemNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categoryItemName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      categoryItemNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'categoryItemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      categoryItemNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'categoryItemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      categoryItemNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categoryItemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      categoryItemNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categoryItemName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      categoryItemNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryItemName',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      categoryItemNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categoryItemName',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      dataSourceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dataSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      dataSourceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dataSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      dataSourceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dataSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      dataSourceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dataSource',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      dataSourceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dataSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      dataSourceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dataSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      dataSourceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dataSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      dataSourceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dataSource',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      dataSourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dataSource',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      dataSourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dataSource',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      enabledEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enabled',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      enabledGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'enabled',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      enabledLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'enabled',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      enabledBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'enabled',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      enabledStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'enabled',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      enabledEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'enabled',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      enabledContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'enabled',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      enabledMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'enabled',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      enabledIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enabled',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      enabledIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'enabled',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      frgnDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frgnDescription',
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      frgnDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frgnDescription',
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      frgnDescriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frgnDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      frgnDescriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frgnDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      frgnDescriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frgnDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      frgnDescriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frgnDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      frgnDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frgnDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      frgnDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frgnDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      frgnDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frgnDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      frgnDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frgnDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      frgnDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frgnDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      frgnDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frgnDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      frgnNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frgnName',
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      frgnNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frgnName',
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      frgnNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frgnName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      frgnNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'frgnName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      frgnNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'frgnName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      frgnNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'frgnName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      frgnNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'frgnName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      frgnNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'frgnName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      frgnNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frgnName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      frgnNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frgnName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      frgnNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frgnName',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      frgnNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frgnName',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      groupItemCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'groupItemCode',
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      groupItemCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'groupItemCode',
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      groupItemCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupItemCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      groupItemCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'groupItemCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      groupItemCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'groupItemCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      groupItemCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'groupItemCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      groupItemCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'groupItemCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      groupItemCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'groupItemCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      groupItemCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'groupItemCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      groupItemCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'groupItemCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      groupItemCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupItemCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      groupItemCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'groupItemCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      imageUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      imageUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      imageUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      imageUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      imageUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      imageUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      imageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      imageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      imageUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      imageUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      imageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      imageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      visOrderEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'visOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      visOrderGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'visOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      visOrderLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'visOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterFilterCondition>
      visOrderBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'visOrder',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ProductCategoryIsarQueryObject on QueryBuilder<ProductCategoryIsar,
    ProductCategoryIsar, QFilterCondition> {}

extension ProductCategoryIsarQueryLinks on QueryBuilder<ProductCategoryIsar,
    ProductCategoryIsar, QFilterCondition> {}

extension ProductCategoryIsarQuerySortBy
    on QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QSortBy> {
  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      sortByCategoryItemCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryItemCode', Sort.asc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      sortByCategoryItemCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryItemCode', Sort.desc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      sortByCategoryItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryItemName', Sort.asc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      sortByCategoryItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryItemName', Sort.desc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      sortByDataSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataSource', Sort.asc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      sortByDataSourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataSource', Sort.desc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      sortByEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.asc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      sortByEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.desc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      sortByFrgnDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frgnDescription', Sort.asc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      sortByFrgnDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frgnDescription', Sort.desc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      sortByFrgnName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frgnName', Sort.asc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      sortByFrgnNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frgnName', Sort.desc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      sortByGroupItemCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupItemCode', Sort.asc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      sortByGroupItemCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupItemCode', Sort.desc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      sortByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      sortByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      sortByVisOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visOrder', Sort.asc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      sortByVisOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visOrder', Sort.desc);
    });
  }
}

extension ProductCategoryIsarQuerySortThenBy
    on QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QSortThenBy> {
  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      thenByCategoryItemCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryItemCode', Sort.asc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      thenByCategoryItemCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryItemCode', Sort.desc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      thenByCategoryItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryItemName', Sort.asc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      thenByCategoryItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryItemName', Sort.desc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      thenByDataSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataSource', Sort.asc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      thenByDataSourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dataSource', Sort.desc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      thenByEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.asc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      thenByEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.desc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      thenByFrgnDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frgnDescription', Sort.asc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      thenByFrgnDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frgnDescription', Sort.desc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      thenByFrgnName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frgnName', Sort.asc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      thenByFrgnNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frgnName', Sort.desc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      thenByGroupItemCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupItemCode', Sort.asc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      thenByGroupItemCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupItemCode', Sort.desc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      thenByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      thenByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      thenByVisOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visOrder', Sort.asc);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QAfterSortBy>
      thenByVisOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visOrder', Sort.desc);
    });
  }
}

extension ProductCategoryIsarQueryWhereDistinct
    on QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QDistinct> {
  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QDistinct>
      distinctByCategoryItemCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoryItemCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QDistinct>
      distinctByCategoryItemName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoryItemName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QDistinct>
      distinctByDataSource({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dataSource', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QDistinct>
      distinctByEnabled({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enabled', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QDistinct>
      distinctByFrgnDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'frgnDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QDistinct>
      distinctByFrgnName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'frgnName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QDistinct>
      distinctByGroupItemCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupItemCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QDistinct>
      distinctByImageUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QDistinct>
      distinctByVisOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visOrder');
    });
  }
}

extension ProductCategoryIsarQueryProperty
    on QueryBuilder<ProductCategoryIsar, ProductCategoryIsar, QQueryProperty> {
  QueryBuilder<ProductCategoryIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ProductCategoryIsar, String, QQueryOperations>
      categoryItemCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoryItemCode');
    });
  }

  QueryBuilder<ProductCategoryIsar, String, QQueryOperations>
      categoryItemNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoryItemName');
    });
  }

  QueryBuilder<ProductCategoryIsar, String, QQueryOperations>
      dataSourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dataSource');
    });
  }

  QueryBuilder<ProductCategoryIsar, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<ProductCategoryIsar, String, QQueryOperations>
      enabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enabled');
    });
  }

  QueryBuilder<ProductCategoryIsar, String?, QQueryOperations>
      frgnDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frgnDescription');
    });
  }

  QueryBuilder<ProductCategoryIsar, String?, QQueryOperations>
      frgnNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frgnName');
    });
  }

  QueryBuilder<ProductCategoryIsar, String?, QQueryOperations>
      groupItemCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupItemCode');
    });
  }

  QueryBuilder<ProductCategoryIsar, String?, QQueryOperations>
      imageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageUrl');
    });
  }

  QueryBuilder<ProductCategoryIsar, int, QQueryOperations> visOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visOrder');
    });
  }
}
