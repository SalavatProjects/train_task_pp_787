// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMoodCollection on Isar {
  IsarCollection<Mood> get moods => this.collection();
}

const MoodSchema = CollectionSchema(
  name: r'Mood',
  id: 6108270824894609419,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'generallyFeeling': PropertySchema(
      id: 1,
      name: r'generallyFeeling',
      type: IsarType.long,
    ),
    r'iconPath': PropertySchema(
      id: 2,
      name: r'iconPath',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'strength': PropertySchema(
      id: 4,
      name: r'strength',
      type: IsarType.long,
    ),
    r'triggeredBy': PropertySchema(
      id: 5,
      name: r'triggeredBy',
      type: IsarType.string,
    )
  },
  estimateSize: _moodEstimateSize,
  serialize: _moodSerialize,
  deserialize: _moodDeserialize,
  deserializeProp: _moodDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _moodGetId,
  getLinks: _moodGetLinks,
  attach: _moodAttach,
  version: '3.1.0+1',
);

int _moodEstimateSize(
  Mood object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.iconPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.triggeredBy;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _moodSerialize(
  Mood object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.date);
  writer.writeLong(offsets[1], object.generallyFeeling);
  writer.writeString(offsets[2], object.iconPath);
  writer.writeString(offsets[3], object.name);
  writer.writeLong(offsets[4], object.strength);
  writer.writeString(offsets[5], object.triggeredBy);
}

Mood _moodDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Mood();
  object.date = reader.readDateTimeOrNull(offsets[0]);
  object.generallyFeeling = reader.readLongOrNull(offsets[1]);
  object.iconPath = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.name = reader.readStringOrNull(offsets[3]);
  object.strength = reader.readLongOrNull(offsets[4]);
  object.triggeredBy = reader.readStringOrNull(offsets[5]);
  return object;
}

P _moodDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _moodGetId(Mood object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _moodGetLinks(Mood object) {
  return [];
}

void _moodAttach(IsarCollection<dynamic> col, Id id, Mood object) {
  object.id = id;
}

extension MoodQueryWhereSort on QueryBuilder<Mood, Mood, QWhere> {
  QueryBuilder<Mood, Mood, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MoodQueryWhere on QueryBuilder<Mood, Mood, QWhereClause> {
  QueryBuilder<Mood, Mood, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Mood, Mood, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Mood, Mood, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Mood, Mood, QAfterWhereClause> idBetween(
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

extension MoodQueryFilter on QueryBuilder<Mood, Mood, QFilterCondition> {
  QueryBuilder<Mood, Mood, QAfterFilterCondition> dateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> dateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> dateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> dateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> dateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> dateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> generallyFeelingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'generallyFeeling',
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> generallyFeelingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'generallyFeeling',
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> generallyFeelingEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'generallyFeeling',
        value: value,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> generallyFeelingGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'generallyFeeling',
        value: value,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> generallyFeelingLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'generallyFeeling',
        value: value,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> generallyFeelingBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'generallyFeeling',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> iconPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'iconPath',
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> iconPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'iconPath',
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> iconPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> iconPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iconPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> iconPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iconPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> iconPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iconPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> iconPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'iconPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> iconPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'iconPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> iconPathContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'iconPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> iconPathMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'iconPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> iconPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconPath',
        value: '',
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> iconPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'iconPath',
        value: '',
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Mood, Mood, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Mood, Mood, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Mood, Mood, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> strengthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'strength',
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> strengthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'strength',
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> strengthEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'strength',
        value: value,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> strengthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'strength',
        value: value,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> strengthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'strength',
        value: value,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> strengthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'strength',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> triggeredByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'triggeredBy',
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> triggeredByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'triggeredBy',
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> triggeredByEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'triggeredBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> triggeredByGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'triggeredBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> triggeredByLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'triggeredBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> triggeredByBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'triggeredBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> triggeredByStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'triggeredBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> triggeredByEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'triggeredBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> triggeredByContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'triggeredBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> triggeredByMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'triggeredBy',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> triggeredByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'triggeredBy',
        value: '',
      ));
    });
  }

  QueryBuilder<Mood, Mood, QAfterFilterCondition> triggeredByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'triggeredBy',
        value: '',
      ));
    });
  }
}

extension MoodQueryObject on QueryBuilder<Mood, Mood, QFilterCondition> {}

extension MoodQueryLinks on QueryBuilder<Mood, Mood, QFilterCondition> {}

extension MoodQuerySortBy on QueryBuilder<Mood, Mood, QSortBy> {
  QueryBuilder<Mood, Mood, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Mood, Mood, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Mood, Mood, QAfterSortBy> sortByGenerallyFeeling() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generallyFeeling', Sort.asc);
    });
  }

  QueryBuilder<Mood, Mood, QAfterSortBy> sortByGenerallyFeelingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generallyFeeling', Sort.desc);
    });
  }

  QueryBuilder<Mood, Mood, QAfterSortBy> sortByIconPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconPath', Sort.asc);
    });
  }

  QueryBuilder<Mood, Mood, QAfterSortBy> sortByIconPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconPath', Sort.desc);
    });
  }

  QueryBuilder<Mood, Mood, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Mood, Mood, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Mood, Mood, QAfterSortBy> sortByStrength() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'strength', Sort.asc);
    });
  }

  QueryBuilder<Mood, Mood, QAfterSortBy> sortByStrengthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'strength', Sort.desc);
    });
  }

  QueryBuilder<Mood, Mood, QAfterSortBy> sortByTriggeredBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'triggeredBy', Sort.asc);
    });
  }

  QueryBuilder<Mood, Mood, QAfterSortBy> sortByTriggeredByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'triggeredBy', Sort.desc);
    });
  }
}

extension MoodQuerySortThenBy on QueryBuilder<Mood, Mood, QSortThenBy> {
  QueryBuilder<Mood, Mood, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Mood, Mood, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Mood, Mood, QAfterSortBy> thenByGenerallyFeeling() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generallyFeeling', Sort.asc);
    });
  }

  QueryBuilder<Mood, Mood, QAfterSortBy> thenByGenerallyFeelingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'generallyFeeling', Sort.desc);
    });
  }

  QueryBuilder<Mood, Mood, QAfterSortBy> thenByIconPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconPath', Sort.asc);
    });
  }

  QueryBuilder<Mood, Mood, QAfterSortBy> thenByIconPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconPath', Sort.desc);
    });
  }

  QueryBuilder<Mood, Mood, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Mood, Mood, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Mood, Mood, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Mood, Mood, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Mood, Mood, QAfterSortBy> thenByStrength() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'strength', Sort.asc);
    });
  }

  QueryBuilder<Mood, Mood, QAfterSortBy> thenByStrengthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'strength', Sort.desc);
    });
  }

  QueryBuilder<Mood, Mood, QAfterSortBy> thenByTriggeredBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'triggeredBy', Sort.asc);
    });
  }

  QueryBuilder<Mood, Mood, QAfterSortBy> thenByTriggeredByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'triggeredBy', Sort.desc);
    });
  }
}

extension MoodQueryWhereDistinct on QueryBuilder<Mood, Mood, QDistinct> {
  QueryBuilder<Mood, Mood, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<Mood, Mood, QDistinct> distinctByGenerallyFeeling() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'generallyFeeling');
    });
  }

  QueryBuilder<Mood, Mood, QDistinct> distinctByIconPath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iconPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mood, Mood, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Mood, Mood, QDistinct> distinctByStrength() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'strength');
    });
  }

  QueryBuilder<Mood, Mood, QDistinct> distinctByTriggeredBy(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'triggeredBy', caseSensitive: caseSensitive);
    });
  }
}

extension MoodQueryProperty on QueryBuilder<Mood, Mood, QQueryProperty> {
  QueryBuilder<Mood, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Mood, DateTime?, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<Mood, int?, QQueryOperations> generallyFeelingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'generallyFeeling');
    });
  }

  QueryBuilder<Mood, String?, QQueryOperations> iconPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iconPath');
    });
  }

  QueryBuilder<Mood, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Mood, int?, QQueryOperations> strengthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'strength');
    });
  }

  QueryBuilder<Mood, String?, QQueryOperations> triggeredByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'triggeredBy');
    });
  }
}
