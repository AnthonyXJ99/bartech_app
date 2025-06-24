// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_material_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProductMaterialISarCollection on Isar {
  IsarCollection<ProductMaterialISar> get productMaterialISars =>
      this.collection();
}

const ProductMaterialISarSchema = CollectionSchema(
  name: r'ProductMaterialISar',
  id: 3008473741373178842,
  properties: {
    r'imageUrl': PropertySchema(
      id: 0,
      name: r'imageUrl',
      type: IsarType.string,
    ),
    r'isPrimary': PropertySchema(
      id: 1,
      name: r'isPrimary',
      type: IsarType.string,
    ),
    r'itemCode': PropertySchema(
      id: 2,
      name: r'itemCode',
      type: IsarType.string,
    ),
    r'itemName': PropertySchema(
      id: 3,
      name: r'itemName',
      type: IsarType.string,
    ),
    r'productItemCode': PropertySchema(
      id: 4,
      name: r'productItemCode',
      type: IsarType.string,
    ),
    r'quantity': PropertySchema(
      id: 5,
      name: r'quantity',
      type: IsarType.double,
    )
  },
  estimateSize: _productMaterialISarEstimateSize,
  serialize: _productMaterialISarSerialize,
  deserialize: _productMaterialISarDeserialize,
  deserializeProp: _productMaterialISarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _productMaterialISarGetId,
  getLinks: _productMaterialISarGetLinks,
  attach: _productMaterialISarAttach,
  version: '3.1.0+1',
);

int _productMaterialISarEstimateSize(
  ProductMaterialISar object,
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
  {
    final value = object.isPrimary;
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

void _productMaterialISarSerialize(
  ProductMaterialISar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.imageUrl);
  writer.writeString(offsets[1], object.isPrimary);
  writer.writeString(offsets[2], object.itemCode);
  writer.writeString(offsets[3], object.itemName);
  writer.writeString(offsets[4], object.productItemCode);
  writer.writeDouble(offsets[5], object.quantity);
}

ProductMaterialISar _productMaterialISarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProductMaterialISar();
  object.id = id;
  object.imageUrl = reader.readStringOrNull(offsets[0]);
  object.isPrimary = reader.readStringOrNull(offsets[1]);
  object.itemCode = reader.readString(offsets[2]);
  object.itemName = reader.readStringOrNull(offsets[3]);
  object.productItemCode = reader.readStringOrNull(offsets[4]);
  object.quantity = reader.readDouble(offsets[5]);
  return object;
}

P _productMaterialISarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _productMaterialISarGetId(ProductMaterialISar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _productMaterialISarGetLinks(
    ProductMaterialISar object) {
  return [];
}

void _productMaterialISarAttach(
    IsarCollection<dynamic> col, Id id, ProductMaterialISar object) {
  object.id = id;
}

extension ProductMaterialISarQueryWhereSort
    on QueryBuilder<ProductMaterialISar, ProductMaterialISar, QWhere> {
  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProductMaterialISarQueryWhere
    on QueryBuilder<ProductMaterialISar, ProductMaterialISar, QWhereClause> {
  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterWhereClause>
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

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterWhereClause>
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

extension ProductMaterialISarQueryFilter on QueryBuilder<ProductMaterialISar,
    ProductMaterialISar, QFilterCondition> {
  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
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

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
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

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
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

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      imageUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      imageUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
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

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
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

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
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

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
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

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
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

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
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

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      imageUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      imageUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      imageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      imageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      isPrimaryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isPrimary',
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      isPrimaryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isPrimary',
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      isPrimaryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPrimary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      isPrimaryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isPrimary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      isPrimaryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isPrimary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      isPrimaryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isPrimary',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      isPrimaryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'isPrimary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      isPrimaryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'isPrimary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      isPrimaryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'isPrimary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      isPrimaryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'isPrimary',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      isPrimaryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPrimary',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      isPrimaryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'isPrimary',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      itemCodeEqualTo(
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

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      itemCodeGreaterThan(
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

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      itemCodeLessThan(
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

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      itemCodeBetween(
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

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
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

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
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

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      itemCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      itemCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      itemCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      itemCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      itemNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'itemName',
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      itemNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'itemName',
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      itemNameEqualTo(
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

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      itemNameGreaterThan(
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

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      itemNameLessThan(
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

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      itemNameBetween(
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

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
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

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
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

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      itemNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'itemName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      itemNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'itemName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      itemNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      itemNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'itemName',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      productItemCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productItemCode',
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      productItemCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productItemCode',
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      productItemCodeEqualTo(
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

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      productItemCodeGreaterThan(
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

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      productItemCodeLessThan(
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

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      productItemCodeBetween(
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

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      productItemCodeStartsWith(
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

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      productItemCodeEndsWith(
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

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      productItemCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productItemCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      productItemCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productItemCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      productItemCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productItemCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      productItemCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productItemCode',
        value: '',
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      quantityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      quantityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      quantityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterFilterCondition>
      quantityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension ProductMaterialISarQueryObject on QueryBuilder<ProductMaterialISar,
    ProductMaterialISar, QFilterCondition> {}

extension ProductMaterialISarQueryLinks on QueryBuilder<ProductMaterialISar,
    ProductMaterialISar, QFilterCondition> {}

extension ProductMaterialISarQuerySortBy
    on QueryBuilder<ProductMaterialISar, ProductMaterialISar, QSortBy> {
  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterSortBy>
      sortByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterSortBy>
      sortByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterSortBy>
      sortByIsPrimary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPrimary', Sort.asc);
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterSortBy>
      sortByIsPrimaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPrimary', Sort.desc);
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterSortBy>
      sortByItemCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCode', Sort.asc);
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterSortBy>
      sortByItemCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCode', Sort.desc);
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterSortBy>
      sortByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterSortBy>
      sortByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterSortBy>
      sortByProductItemCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productItemCode', Sort.asc);
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterSortBy>
      sortByProductItemCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productItemCode', Sort.desc);
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterSortBy>
      sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterSortBy>
      sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }
}

extension ProductMaterialISarQuerySortThenBy
    on QueryBuilder<ProductMaterialISar, ProductMaterialISar, QSortThenBy> {
  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterSortBy>
      thenByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterSortBy>
      thenByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterSortBy>
      thenByIsPrimary() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPrimary', Sort.asc);
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterSortBy>
      thenByIsPrimaryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPrimary', Sort.desc);
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterSortBy>
      thenByItemCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCode', Sort.asc);
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterSortBy>
      thenByItemCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCode', Sort.desc);
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterSortBy>
      thenByItemName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.asc);
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterSortBy>
      thenByItemNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemName', Sort.desc);
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterSortBy>
      thenByProductItemCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productItemCode', Sort.asc);
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterSortBy>
      thenByProductItemCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productItemCode', Sort.desc);
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterSortBy>
      thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QAfterSortBy>
      thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }
}

extension ProductMaterialISarQueryWhereDistinct
    on QueryBuilder<ProductMaterialISar, ProductMaterialISar, QDistinct> {
  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QDistinct>
      distinctByImageUrl({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QDistinct>
      distinctByIsPrimary({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPrimary', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QDistinct>
      distinctByItemCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QDistinct>
      distinctByItemName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QDistinct>
      distinctByProductItemCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productItemCode',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProductMaterialISar, ProductMaterialISar, QDistinct>
      distinctByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity');
    });
  }
}

extension ProductMaterialISarQueryProperty
    on QueryBuilder<ProductMaterialISar, ProductMaterialISar, QQueryProperty> {
  QueryBuilder<ProductMaterialISar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ProductMaterialISar, String?, QQueryOperations>
      imageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageUrl');
    });
  }

  QueryBuilder<ProductMaterialISar, String?, QQueryOperations>
      isPrimaryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPrimary');
    });
  }

  QueryBuilder<ProductMaterialISar, String, QQueryOperations>
      itemCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemCode');
    });
  }

  QueryBuilder<ProductMaterialISar, String?, QQueryOperations>
      itemNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemName');
    });
  }

  QueryBuilder<ProductMaterialISar, String?, QQueryOperations>
      productItemCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productItemCode');
    });
  }

  QueryBuilder<ProductMaterialISar, double, QQueryOperations>
      quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }
}
