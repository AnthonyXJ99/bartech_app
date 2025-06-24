// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProductIsarCollection on Isar {
  IsarCollection<ProductIsar> get productIsars => this.collection();
}

const ProductIsarSchema = CollectionSchema(
  name: r'ProductIsar',
  id: 4795372949910402302,
  properties: {
    r'available': PropertySchema(
      id: 0,
      name: r'available',
      type: IsarType.string,
    ),
    r'categoryItemCode': PropertySchema(
      id: 1,
      name: r'categoryItemCode',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'discount': PropertySchema(
      id: 3,
      name: r'discount',
      type: IsarType.double,
    ),
    r'eanCode': PropertySchema(
      id: 4,
      name: r'eanCode',
      type: IsarType.string,
    ),
    r'enabled': PropertySchema(
      id: 5,
      name: r'enabled',
      type: IsarType.string,
    ),
    r'frgnDescription': PropertySchema(
      id: 6,
      name: r'frgnDescription',
      type: IsarType.string,
    ),
    r'frgnName': PropertySchema(
      id: 7,
      name: r'frgnName',
      type: IsarType.string,
    ),
    r'groupItemCode': PropertySchema(
      id: 8,
      name: r'groupItemCode',
      type: IsarType.string,
    ),
    r'imageUrl': PropertySchema(
      id: 9,
      name: r'imageUrl',
      type: IsarType.string,
    ),
    r'itemCode': PropertySchema(
      id: 10,
      name: r'itemCode',
      type: IsarType.string,
    ),
    r'itemName': PropertySchema(
      id: 11,
      name: r'itemName',
      type: IsarType.string,
    ),
    r'price': PropertySchema(
      id: 12,
      name: r'price',
      type: IsarType.double,
    ),
    r'rating': PropertySchema(
      id: 13,
      name: r'rating',
      type: IsarType.double,
    ),
    r'sellItem': PropertySchema(
      id: 14,
      name: r'sellItem',
      type: IsarType.string,
    ),
    r'waitingTime': PropertySchema(
      id: 15,
      name: r'waitingTime',
      type: IsarType.string,
    )
  },
  estimateSize: _productIsarEstimateSize,
  serialize: _productIsarSerialize,
  deserialize: _productIsarDeserialize,
  deserializeProp: _productIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'material': LinkSchema(
      id: -2889349078857328806,
      name: r'material',
      target: r'ProductMaterialISar',
      single: false,
    ),
    r'accompaniment': LinkSchema(
      id: 6760582248627368196,
      name: r'accompaniment',
      target: r'ProductAccompanimentIsar',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _productIsarGetId,
  getLinks: _productIsarGetLinks,
  attach: _productIsarAttach,
  version: '3.1.0+1',
);

int _productIsarEstimateSize(
  ProductIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.available.length * 3;
  {
    final value = object.categoryItemCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.eanCode;
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
  {
    final value = object.itemCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.itemName.length * 3;
  {
    final value = object.sellItem;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.waitingTime;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _productIsarSerialize(
  ProductIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.available);
  writer.writeString(offsets[1], object.categoryItemCode);
  writer.writeString(offsets[2], object.description);
  writer.writeDouble(offsets[3], object.discount);
  writer.writeString(offsets[4], object.eanCode);
  writer.writeString(offsets[5], object.enabled);
  writer.writeString(offsets[6], object.frgnDescription);
  writer.writeString(offsets[7], object.frgnName);
  writer.writeString(offsets[8], object.groupItemCode);
  writer.writeString(offsets[9], object.imageUrl);
  writer.writeString(offsets[10], object.itemCode);
  writer.writeString(offsets[11], object.itemName);
  writer.writeDouble(offsets[12], object.price);
  writer.writeDouble(offsets[13], object.rating);
  writer.writeString(offsets[14], object.sellItem);
  writer.writeString(offsets[15], object.waitingTime);
}

ProductIsar _productIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProductIsar();
  object.available = reader.readString(offsets[0]);
  object.categoryItemCode = reader.readStringOrNull(offsets[1]);
  object.description = reader.readStringOrNull(offsets[2]);
  object.discount = reader.readDoubleOrNull(offsets[3]);
  object.eanCode = reader.readStringOrNull(offsets[4]);
  object.enabled = reader.readString(offsets[5]);
  object.frgnDescription = reader.readStringOrNull(offsets[6]);
  object.frgnName = reader.readStringOrNull(offsets[7]);
  object.groupItemCode = reader.readStringOrNull(offsets[8]);
  object.id = id;
  object.imageUrl = reader.readStringOrNull(offsets[9]);
  object.itemCode = reader.readStringOrNull(offsets[10]);
  object.itemName = reader.readString(offsets[11]);
  object.price = reader.readDouble(offsets[12]);
  object.rating = reader.readDoubleOrNull(offsets[13]);
  object.sellItem = reader.readStringOrNull(offsets[14]);
  object.waitingTime = reader.readStringOrNull(offsets[15]);
  return object;
}

P _productIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    case 13:
      return (reader.readDoubleOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _productIsarGetId(ProductIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _productIsarGetLinks(ProductIsar object) {
  return [object.material, object.accompaniment];
}

void _productIsarAttach(
    IsarCollection<dynamic> col, Id id, ProductIsar object) {
  object.id = id;
  object.material
      .attach(col, col.isar.collection<ProductMaterialISar>(), r'material', id);
  object.accompaniment.attach(col,
      col.isar.collection<ProductAccompanimentIsar>(), r'accompaniment', id);
}

extension ProductIsarQueryWhereSort
    on QueryBuilder<ProductIsar, ProductIsar, QWhere> {
  QueryBuilder<ProductIsar, ProductIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProductIsarQueryWhere
    on QueryBuilder<ProductIsar, ProductIsar, QWhereClause> {
  QueryBuilder<ProductIsar, ProductIsar, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterWhereClause> idBetween(
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

extension ProductIsarQueryFilter
    on QueryBuilder<ProductIsar, ProductIsar, QFilterCondition> {
  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      availableEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'available',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      availableGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'available',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      availableLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'available',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      availableBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'available',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      availableStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'available',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      availableEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'available',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      availableContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'available',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      availableMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'available',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      availableIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'available',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      availableIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'available',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      categoryItemCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'categoryItemCode',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      categoryItemCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'categoryItemCode',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      categoryItemCodeEqualTo(
    String? value, {
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      categoryItemCodeGreaterThan(
    String? value, {
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      categoryItemCodeLessThan(
    String? value, {
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      categoryItemCodeBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      categoryItemCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categoryItemCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      categoryItemCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categoryItemCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      categoryItemCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryItemCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      categoryItemCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categoryItemCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      discountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'discount',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      discountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'discount',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> discountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      discountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      discountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> discountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      eanCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'eanCode',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      eanCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'eanCode',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> eanCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eanCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      eanCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'eanCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> eanCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'eanCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> eanCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'eanCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      eanCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'eanCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> eanCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'eanCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> eanCodeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'eanCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> eanCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'eanCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      eanCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eanCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      eanCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'eanCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> enabledEqualTo(
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> enabledLessThan(
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> enabledBetween(
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> enabledEndsWith(
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> enabledContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'enabled',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> enabledMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'enabled',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      enabledIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enabled',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      enabledIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'enabled',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      frgnDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frgnDescription',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      frgnDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frgnDescription',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      frgnDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frgnDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      frgnDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frgnDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      frgnDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frgnDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      frgnDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frgnDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      frgnNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'frgnName',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      frgnNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'frgnName',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> frgnNameEqualTo(
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> frgnNameBetween(
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      frgnNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'frgnName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> frgnNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'frgnName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      frgnNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'frgnName',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      frgnNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'frgnName',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      groupItemCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'groupItemCode',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      groupItemCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'groupItemCode',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      groupItemCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'groupItemCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      groupItemCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'groupItemCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      groupItemCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupItemCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      groupItemCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'groupItemCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      imageUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      imageUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> imageUrlEqualTo(
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> imageUrlBetween(
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
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

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      imageUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> imageUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      imageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      imageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      itemCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'itemCode',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      itemCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'itemCode',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> itemCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      itemCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      itemCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> itemCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      itemCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      itemCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      itemCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> itemCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      itemCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      itemCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> itemNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      itemNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      itemNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> itemNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'itemName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      itemNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      itemNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      itemNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> itemNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      itemNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      itemNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> priceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      priceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> priceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> priceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'price',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> ratingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rating',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      ratingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rating',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> ratingEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      ratingGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> ratingLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> ratingBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rating',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      sellItemIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sellItem',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      sellItemIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sellItem',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> sellItemEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sellItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      sellItemGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sellItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      sellItemLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sellItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> sellItemBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sellItem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      sellItemStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sellItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      sellItemEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sellItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      sellItemContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sellItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> sellItemMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sellItem',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      sellItemIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sellItem',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      sellItemIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sellItem',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      waitingTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'waitingTime',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      waitingTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'waitingTime',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      waitingTimeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'waitingTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      waitingTimeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'waitingTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      waitingTimeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'waitingTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      waitingTimeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'waitingTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      waitingTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'waitingTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      waitingTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'waitingTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      waitingTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'waitingTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      waitingTimeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'waitingTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      waitingTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'waitingTime',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      waitingTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'waitingTime',
        value: '',
      ));
    });
  }
}

extension ProductIsarQueryObject
    on QueryBuilder<ProductIsar, ProductIsar, QFilterCondition> {}

extension ProductIsarQueryLinks
    on QueryBuilder<ProductIsar, ProductIsar, QFilterCondition> {
  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> material(
      FilterQuery<ProductMaterialISar> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'material');
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      materialLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'material', length, true, length, true);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      materialIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'material', 0, true, 0, true);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      materialIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'material', 0, false, 999999, true);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      materialLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'material', 0, true, length, include);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      materialLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'material', length, include, 999999, true);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      materialLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'material', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition> accompaniment(
      FilterQuery<ProductAccompanimentIsar> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'accompaniment');
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      accompanimentLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'accompaniment', length, true, length, true);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      accompanimentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'accompaniment', 0, true, 0, true);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      accompanimentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'accompaniment', 0, false, 999999, true);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      accompanimentLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'accompaniment', 0, true, length, include);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      accompanimentLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'accompaniment', length, include, 999999, true);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterFilterCondition>
      accompanimentLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'accompaniment', lower, includeLower, upper, includeUpper);
    });
  }
}

extension ProductIsarQuerySortBy
    on QueryBuilder<ProductIsar, ProductIsar, QSortBy> {
  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> sortByAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'available', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> sortByAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'available', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy>
      sortByCategoryItemCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryItemCode', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy>
      sortByCategoryItemCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryItemCode', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> sortByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> sortByDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> sortByEanCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eanCode', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> sortByEanCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eanCode', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> sortByEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> sortByEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> sortByFrgnDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frgnDescription', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy>
      sortByFrgnDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frgnDescription', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> sortByFrgnName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frgnName', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> sortByFrgnNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frgnName', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> sortByGroupItemCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupItemCode', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy>
      sortByGroupItemCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupItemCode', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> sortByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> sortByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> sortByItemCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCode', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> sortByItemCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCode', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> sortByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> sortByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> sortByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> sortByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> sortBySellItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellItem', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> sortBySellItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellItem', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> sortByWaitingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waitingTime', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> sortByWaitingTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waitingTime', Sort.desc);
    });
  }
}

extension ProductIsarQuerySortThenBy
    on QueryBuilder<ProductIsar, ProductIsar, QSortThenBy> {
  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> thenByAvailable() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'available', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> thenByAvailableDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'available', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy>
      thenByCategoryItemCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryItemCode', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy>
      thenByCategoryItemCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryItemCode', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> thenByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> thenByDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discount', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> thenByEanCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eanCode', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> thenByEanCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'eanCode', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> thenByEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> thenByEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enabled', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> thenByFrgnDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frgnDescription', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy>
      thenByFrgnDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frgnDescription', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> thenByFrgnName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frgnName', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> thenByFrgnNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'frgnName', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> thenByGroupItemCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupItemCode', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy>
      thenByGroupItemCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupItemCode', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> thenByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> thenByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> thenByItemCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCode', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> thenByItemCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCode', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> thenByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> thenByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> thenByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> thenByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> thenBySellItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellItem', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> thenBySellItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sellItem', Sort.desc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> thenByWaitingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waitingTime', Sort.asc);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QAfterSortBy> thenByWaitingTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waitingTime', Sort.desc);
    });
  }
}

extension ProductIsarQueryWhereDistinct
    on QueryBuilder<ProductIsar, ProductIsar, QDistinct> {
  QueryBuilder<ProductIsar, ProductIsar, QDistinct> distinctByAvailable(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'available', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QDistinct> distinctByCategoryItemCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoryItemCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QDistinct> distinctByDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discount');
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QDistinct> distinctByEanCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'eanCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QDistinct> distinctByEnabled(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enabled', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QDistinct> distinctByFrgnDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'frgnDescription',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QDistinct> distinctByFrgnName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'frgnName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QDistinct> distinctByGroupItemCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupItemCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QDistinct> distinctByImageUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QDistinct> distinctByItemCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QDistinct> distinctByItemName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QDistinct> distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QDistinct> distinctByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rating');
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QDistinct> distinctBySellItem(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sellItem', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductIsar, ProductIsar, QDistinct> distinctByWaitingTime(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'waitingTime', caseSensitive: caseSensitive);
    });
  }
}

extension ProductIsarQueryProperty
    on QueryBuilder<ProductIsar, ProductIsar, QQueryProperty> {
  QueryBuilder<ProductIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ProductIsar, String, QQueryOperations> availableProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'available');
    });
  }

  QueryBuilder<ProductIsar, String?, QQueryOperations>
      categoryItemCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoryItemCode');
    });
  }

  QueryBuilder<ProductIsar, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<ProductIsar, double?, QQueryOperations> discountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discount');
    });
  }

  QueryBuilder<ProductIsar, String?, QQueryOperations> eanCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'eanCode');
    });
  }

  QueryBuilder<ProductIsar, String, QQueryOperations> enabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enabled');
    });
  }

  QueryBuilder<ProductIsar, String?, QQueryOperations>
      frgnDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frgnDescription');
    });
  }

  QueryBuilder<ProductIsar, String?, QQueryOperations> frgnNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'frgnName');
    });
  }

  QueryBuilder<ProductIsar, String?, QQueryOperations> groupItemCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupItemCode');
    });
  }

  QueryBuilder<ProductIsar, String?, QQueryOperations> imageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageUrl');
    });
  }

  QueryBuilder<ProductIsar, String?, QQueryOperations> itemCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemCode');
    });
  }

  QueryBuilder<ProductIsar, String, QQueryOperations> itemNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemName');
    });
  }

  QueryBuilder<ProductIsar, double, QQueryOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<ProductIsar, double?, QQueryOperations> ratingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rating');
    });
  }

  QueryBuilder<ProductIsar, String?, QQueryOperations> sellItemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sellItem');
    });
  }

  QueryBuilder<ProductIsar, String?, QQueryOperations> waitingTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'waitingTime');
    });
  }
}
