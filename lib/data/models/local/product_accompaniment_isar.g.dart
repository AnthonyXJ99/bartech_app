// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_accompaniment_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProductAccompanimentIsarCollection on Isar {
  IsarCollection<ProductAccompanimentIsar> get productAccompanimentIsars =>
      this.collection();
}

const ProductAccompanimentIsarSchema = CollectionSchema(
  name: r'ProductAccompanimentIsar',
  id: -1639716471070517884,
  properties: {
    r'imageUrl': PropertySchema(
      id: 0,
      name: r'imageUrl',
      type: IsarType.string,
    ),
    r'itemCode': PropertySchema(
      id: 1,
      name: r'itemCode',
      type: IsarType.string,
    ),
    r'itemName': PropertySchema(
      id: 2,
      name: r'itemName',
      type: IsarType.string,
    ),
    r'price': PropertySchema(
      id: 3,
      name: r'price',
      type: IsarType.double,
    ),
    r'priceOld': PropertySchema(
      id: 4,
      name: r'priceOld',
      type: IsarType.double,
    ),
    r'productItemCode': PropertySchema(
      id: 5,
      name: r'productItemCode',
      type: IsarType.string,
    )
  },
  estimateSize: _productAccompanimentIsarEstimateSize,
  serialize: _productAccompanimentIsarSerialize,
  deserialize: _productAccompanimentIsarDeserialize,
  deserializeProp: _productAccompanimentIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _productAccompanimentIsarGetId,
  getLinks: _productAccompanimentIsarGetLinks,
  attach: _productAccompanimentIsarAttach,
  version: '3.1.0+1',
);

int _productAccompanimentIsarEstimateSize(
  ProductAccompanimentIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.imageUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.itemCode.length * 3;
  {
    final value = object.itemName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.productItemCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _productAccompanimentIsarSerialize(
  ProductAccompanimentIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.imageUrl);
  writer.writeString(offsets[1], object.itemCode);
  writer.writeString(offsets[2], object.itemName);
  writer.writeDouble(offsets[3], object.price);
  writer.writeDouble(offsets[4], object.priceOld);
  writer.writeString(offsets[5], object.productItemCode);
}

ProductAccompanimentIsar _productAccompanimentIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProductAccompanimentIsar();
  object.id = id;
  object.imageUrl = reader.readStringOrNull(offsets[0]);
  object.itemCode = reader.readString(offsets[1]);
  object.itemName = reader.readStringOrNull(offsets[2]);
  object.price = reader.readDouble(offsets[3]);
  object.priceOld = reader.readDouble(offsets[4]);
  object.productItemCode = reader.readStringOrNull(offsets[5]);
  return object;
}

P _productAccompanimentIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _productAccompanimentIsarGetId(ProductAccompanimentIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _productAccompanimentIsarGetLinks(
    ProductAccompanimentIsar object) {
  return [];
}

void _productAccompanimentIsarAttach(
    IsarCollection<dynamic> col, Id id, ProductAccompanimentIsar object) {
  object.id = id;
}

extension ProductAccompanimentIsarQueryWhereSort on QueryBuilder<
    ProductAccompanimentIsar, ProductAccompanimentIsar, QWhere> {
  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProductAccompanimentIsarQueryWhere on QueryBuilder<
    ProductAccompanimentIsar, ProductAccompanimentIsar, QWhereClause> {
  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterWhereClause> idBetween(
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

extension ProductAccompanimentIsarQueryFilter on QueryBuilder<
    ProductAccompanimentIsar, ProductAccompanimentIsar, QFilterCondition> {
  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> imageUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> imageUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> imageUrlEqualTo(
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

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> imageUrlGreaterThan(
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

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> imageUrlLessThan(
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

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> imageUrlBetween(
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

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> imageUrlStartsWith(
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

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> imageUrlEndsWith(
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

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
          QAfterFilterCondition>
      imageUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
          QAfterFilterCondition>
      imageUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> imageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> imageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> itemCodeEqualTo(
    String value, {
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

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> itemCodeGreaterThan(
    String value, {
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

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> itemCodeLessThan(
    String value, {
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

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> itemCodeBetween(
    String lower,
    String upper, {
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

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> itemCodeStartsWith(
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

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> itemCodeEndsWith(
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

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
          QAfterFilterCondition>
      itemCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
          QAfterFilterCondition>
      itemCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> itemCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> itemCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> itemNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'itemName',
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> itemNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'itemName',
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> itemNameEqualTo(
    String? value, {
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

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> itemNameGreaterThan(
    String? value, {
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

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> itemNameLessThan(
    String? value, {
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

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> itemNameBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> itemNameStartsWith(
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

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> itemNameEndsWith(
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

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
          QAfterFilterCondition>
      itemNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
          QAfterFilterCondition>
      itemNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> itemNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> itemNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> priceEqualTo(
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

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> priceGreaterThan(
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

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> priceLessThan(
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

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> priceBetween(
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

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> priceOldEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priceOld',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> priceOldGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priceOld',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> priceOldLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priceOld',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> priceOldBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priceOld',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> productItemCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productItemCode',
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> productItemCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productItemCode',
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> productItemCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productItemCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> productItemCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productItemCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> productItemCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productItemCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> productItemCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productItemCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> productItemCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'productItemCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> productItemCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'productItemCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
          QAfterFilterCondition>
      productItemCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productItemCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
          QAfterFilterCondition>
      productItemCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productItemCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> productItemCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productItemCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar,
      QAfterFilterCondition> productItemCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productItemCode',
        value: '',
      ));
    });
  }
}

extension ProductAccompanimentIsarQueryObject on QueryBuilder<
    ProductAccompanimentIsar, ProductAccompanimentIsar, QFilterCondition> {}

extension ProductAccompanimentIsarQueryLinks on QueryBuilder<
    ProductAccompanimentIsar, ProductAccompanimentIsar, QFilterCondition> {}

extension ProductAccompanimentIsarQuerySortBy on QueryBuilder<
    ProductAccompanimentIsar, ProductAccompanimentIsar, QSortBy> {
  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QAfterSortBy>
      sortByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QAfterSortBy>
      sortByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QAfterSortBy>
      sortByItemCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCode', Sort.asc);
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QAfterSortBy>
      sortByItemCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCode', Sort.desc);
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QAfterSortBy>
      sortByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QAfterSortBy>
      sortByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QAfterSortBy>
      sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QAfterSortBy>
      sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QAfterSortBy>
      sortByPriceOld() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceOld', Sort.asc);
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QAfterSortBy>
      sortByPriceOldDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceOld', Sort.desc);
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QAfterSortBy>
      sortByProductItemCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productItemCode', Sort.asc);
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QAfterSortBy>
      sortByProductItemCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productItemCode', Sort.desc);
    });
  }
}

extension ProductAccompanimentIsarQuerySortThenBy on QueryBuilder<
    ProductAccompanimentIsar, ProductAccompanimentIsar, QSortThenBy> {
  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QAfterSortBy>
      thenByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QAfterSortBy>
      thenByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QAfterSortBy>
      thenByItemCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCode', Sort.asc);
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QAfterSortBy>
      thenByItemCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCode', Sort.desc);
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QAfterSortBy>
      thenByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QAfterSortBy>
      thenByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QAfterSortBy>
      thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QAfterSortBy>
      thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QAfterSortBy>
      thenByPriceOld() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceOld', Sort.asc);
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QAfterSortBy>
      thenByPriceOldDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priceOld', Sort.desc);
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QAfterSortBy>
      thenByProductItemCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productItemCode', Sort.asc);
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QAfterSortBy>
      thenByProductItemCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productItemCode', Sort.desc);
    });
  }
}

extension ProductAccompanimentIsarQueryWhereDistinct on QueryBuilder<
    ProductAccompanimentIsar, ProductAccompanimentIsar, QDistinct> {
  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QDistinct>
      distinctByImageUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QDistinct>
      distinctByItemCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QDistinct>
      distinctByItemName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QDistinct>
      distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QDistinct>
      distinctByPriceOld() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priceOld');
    });
  }

  QueryBuilder<ProductAccompanimentIsar, ProductAccompanimentIsar, QDistinct>
      distinctByProductItemCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productItemCode',
          caseSensitive: caseSensitive);
    });
  }
}

extension ProductAccompanimentIsarQueryProperty on QueryBuilder<
    ProductAccompanimentIsar, ProductAccompanimentIsar, QQueryProperty> {
  QueryBuilder<ProductAccompanimentIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ProductAccompanimentIsar, String?, QQueryOperations>
      imageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageUrl');
    });
  }

  QueryBuilder<ProductAccompanimentIsar, String, QQueryOperations>
      itemCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemCode');
    });
  }

  QueryBuilder<ProductAccompanimentIsar, String?, QQueryOperations>
      itemNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemName');
    });
  }

  QueryBuilder<ProductAccompanimentIsar, double, QQueryOperations>
      priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<ProductAccompanimentIsar, double, QQueryOperations>
      priceOldProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priceOld');
    });
  }

  QueryBuilder<ProductAccompanimentIsar, String?, QQueryOperations>
      productItemCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productItemCode');
    });
  }
}
