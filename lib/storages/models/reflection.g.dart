// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reflection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetReflectionCollection on Isar {
  IsarCollection<Reflection> get reflections => this.collection();
}

const ReflectionSchema = CollectionSchema(
  name: r'Reflection',
  id: -4896689789499089769,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'describeAnotherPerson': PropertySchema(
      id: 1,
      name: r'describeAnotherPerson',
      type: IsarType.string,
    ),
    r'emotionInBody': PropertySchema(
      id: 2,
      name: r'emotionInBody',
      type: IsarType.string,
    ),
    r'emotionInfluenceActions': PropertySchema(
      id: 3,
      name: r'emotionInfluenceActions',
      type: IsarType.string,
    ),
    r'feelSameThing': PropertySchema(
      id: 4,
      name: r'feelSameThing',
      type: IsarType.string,
    ),
    r'firstWord': PropertySchema(
      id: 5,
      name: r'firstWord',
      type: IsarType.string,
    ),
    r'secondWord': PropertySchema(
      id: 6,
      name: r'secondWord',
      type: IsarType.string,
    ),
    r'thirdWord': PropertySchema(
      id: 7,
      name: r'thirdWord',
      type: IsarType.string,
    )
  },
  estimateSize: _reflectionEstimateSize,
  serialize: _reflectionSerialize,
  deserialize: _reflectionDeserialize,
  deserializeProp: _reflectionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _reflectionGetId,
  getLinks: _reflectionGetLinks,
  attach: _reflectionAttach,
  version: '3.1.0+1',
);

int _reflectionEstimateSize(
  Reflection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.describeAnotherPerson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.emotionInBody;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.emotionInfluenceActions;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.feelSameThing;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.firstWord;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.secondWord;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.thirdWord;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _reflectionSerialize(
  Reflection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.date);
  writer.writeString(offsets[1], object.describeAnotherPerson);
  writer.writeString(offsets[2], object.emotionInBody);
  writer.writeString(offsets[3], object.emotionInfluenceActions);
  writer.writeString(offsets[4], object.feelSameThing);
  writer.writeString(offsets[5], object.firstWord);
  writer.writeString(offsets[6], object.secondWord);
  writer.writeString(offsets[7], object.thirdWord);
}

Reflection _reflectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Reflection();
  object.date = reader.readDateTimeOrNull(offsets[0]);
  object.describeAnotherPerson = reader.readStringOrNull(offsets[1]);
  object.emotionInBody = reader.readStringOrNull(offsets[2]);
  object.emotionInfluenceActions = reader.readStringOrNull(offsets[3]);
  object.feelSameThing = reader.readStringOrNull(offsets[4]);
  object.firstWord = reader.readStringOrNull(offsets[5]);
  object.id = id;
  object.secondWord = reader.readStringOrNull(offsets[6]);
  object.thirdWord = reader.readStringOrNull(offsets[7]);
  return object;
}

P _reflectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _reflectionGetId(Reflection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _reflectionGetLinks(Reflection object) {
  return [];
}

void _reflectionAttach(IsarCollection<dynamic> col, Id id, Reflection object) {
  object.id = id;
}

extension ReflectionQueryWhereSort
    on QueryBuilder<Reflection, Reflection, QWhere> {
  QueryBuilder<Reflection, Reflection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ReflectionQueryWhere
    on QueryBuilder<Reflection, Reflection, QWhereClause> {
  QueryBuilder<Reflection, Reflection, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Reflection, Reflection, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterWhereClause> idBetween(
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

extension ReflectionQueryFilter
    on QueryBuilder<Reflection, Reflection, QFilterCondition> {
  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> dateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> dateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> dateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> dateGreaterThan(
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

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> dateLessThan(
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

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> dateBetween(
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

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      describeAnotherPersonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'describeAnotherPerson',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      describeAnotherPersonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'describeAnotherPerson',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      describeAnotherPersonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'describeAnotherPerson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      describeAnotherPersonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'describeAnotherPerson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      describeAnotherPersonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'describeAnotherPerson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      describeAnotherPersonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'describeAnotherPerson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      describeAnotherPersonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'describeAnotherPerson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      describeAnotherPersonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'describeAnotherPerson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      describeAnotherPersonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'describeAnotherPerson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      describeAnotherPersonMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'describeAnotherPerson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      describeAnotherPersonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'describeAnotherPerson',
        value: '',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      describeAnotherPersonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'describeAnotherPerson',
        value: '',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      emotionInBodyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'emotionInBody',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      emotionInBodyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'emotionInBody',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      emotionInBodyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emotionInBody',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      emotionInBodyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'emotionInBody',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      emotionInBodyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'emotionInBody',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      emotionInBodyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'emotionInBody',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      emotionInBodyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'emotionInBody',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      emotionInBodyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'emotionInBody',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      emotionInBodyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'emotionInBody',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      emotionInBodyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'emotionInBody',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      emotionInBodyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emotionInBody',
        value: '',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      emotionInBodyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'emotionInBody',
        value: '',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      emotionInfluenceActionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'emotionInfluenceActions',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      emotionInfluenceActionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'emotionInfluenceActions',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      emotionInfluenceActionsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emotionInfluenceActions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      emotionInfluenceActionsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'emotionInfluenceActions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      emotionInfluenceActionsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'emotionInfluenceActions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      emotionInfluenceActionsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'emotionInfluenceActions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      emotionInfluenceActionsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'emotionInfluenceActions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      emotionInfluenceActionsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'emotionInfluenceActions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      emotionInfluenceActionsContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'emotionInfluenceActions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      emotionInfluenceActionsMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'emotionInfluenceActions',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      emotionInfluenceActionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emotionInfluenceActions',
        value: '',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      emotionInfluenceActionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'emotionInfluenceActions',
        value: '',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      feelSameThingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'feelSameThing',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      feelSameThingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'feelSameThing',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      feelSameThingEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'feelSameThing',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      feelSameThingGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'feelSameThing',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      feelSameThingLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'feelSameThing',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      feelSameThingBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'feelSameThing',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      feelSameThingStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'feelSameThing',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      feelSameThingEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'feelSameThing',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      feelSameThingContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'feelSameThing',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      feelSameThingMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'feelSameThing',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      feelSameThingIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'feelSameThing',
        value: '',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      feelSameThingIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'feelSameThing',
        value: '',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      firstWordIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'firstWord',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      firstWordIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'firstWord',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> firstWordEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      firstWordGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firstWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> firstWordLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firstWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> firstWordBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firstWord',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      firstWordStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'firstWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> firstWordEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'firstWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> firstWordContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'firstWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> firstWordMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'firstWord',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      firstWordIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstWord',
        value: '',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      firstWordIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'firstWord',
        value: '',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      secondWordIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'secondWord',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      secondWordIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'secondWord',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> secondWordEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'secondWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      secondWordGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'secondWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      secondWordLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'secondWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> secondWordBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'secondWord',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      secondWordStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'secondWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      secondWordEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'secondWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      secondWordContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'secondWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> secondWordMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'secondWord',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      secondWordIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'secondWord',
        value: '',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      secondWordIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'secondWord',
        value: '',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      thirdWordIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'thirdWord',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      thirdWordIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'thirdWord',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> thirdWordEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thirdWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      thirdWordGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'thirdWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> thirdWordLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'thirdWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> thirdWordBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'thirdWord',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      thirdWordStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'thirdWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> thirdWordEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'thirdWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> thirdWordContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'thirdWord',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition> thirdWordMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'thirdWord',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      thirdWordIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thirdWord',
        value: '',
      ));
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterFilterCondition>
      thirdWordIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'thirdWord',
        value: '',
      ));
    });
  }
}

extension ReflectionQueryObject
    on QueryBuilder<Reflection, Reflection, QFilterCondition> {}

extension ReflectionQueryLinks
    on QueryBuilder<Reflection, Reflection, QFilterCondition> {}

extension ReflectionQuerySortBy
    on QueryBuilder<Reflection, Reflection, QSortBy> {
  QueryBuilder<Reflection, Reflection, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy>
      sortByDescribeAnotherPerson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'describeAnotherPerson', Sort.asc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy>
      sortByDescribeAnotherPersonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'describeAnotherPerson', Sort.desc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy> sortByEmotionInBody() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emotionInBody', Sort.asc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy> sortByEmotionInBodyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emotionInBody', Sort.desc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy>
      sortByEmotionInfluenceActions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emotionInfluenceActions', Sort.asc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy>
      sortByEmotionInfluenceActionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emotionInfluenceActions', Sort.desc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy> sortByFeelSameThing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feelSameThing', Sort.asc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy> sortByFeelSameThingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feelSameThing', Sort.desc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy> sortByFirstWord() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstWord', Sort.asc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy> sortByFirstWordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstWord', Sort.desc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy> sortBySecondWord() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secondWord', Sort.asc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy> sortBySecondWordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secondWord', Sort.desc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy> sortByThirdWord() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thirdWord', Sort.asc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy> sortByThirdWordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thirdWord', Sort.desc);
    });
  }
}

extension ReflectionQuerySortThenBy
    on QueryBuilder<Reflection, Reflection, QSortThenBy> {
  QueryBuilder<Reflection, Reflection, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy>
      thenByDescribeAnotherPerson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'describeAnotherPerson', Sort.asc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy>
      thenByDescribeAnotherPersonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'describeAnotherPerson', Sort.desc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy> thenByEmotionInBody() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emotionInBody', Sort.asc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy> thenByEmotionInBodyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emotionInBody', Sort.desc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy>
      thenByEmotionInfluenceActions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emotionInfluenceActions', Sort.asc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy>
      thenByEmotionInfluenceActionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'emotionInfluenceActions', Sort.desc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy> thenByFeelSameThing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feelSameThing', Sort.asc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy> thenByFeelSameThingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'feelSameThing', Sort.desc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy> thenByFirstWord() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstWord', Sort.asc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy> thenByFirstWordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstWord', Sort.desc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy> thenBySecondWord() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secondWord', Sort.asc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy> thenBySecondWordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secondWord', Sort.desc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy> thenByThirdWord() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thirdWord', Sort.asc);
    });
  }

  QueryBuilder<Reflection, Reflection, QAfterSortBy> thenByThirdWordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thirdWord', Sort.desc);
    });
  }
}

extension ReflectionQueryWhereDistinct
    on QueryBuilder<Reflection, Reflection, QDistinct> {
  QueryBuilder<Reflection, Reflection, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<Reflection, Reflection, QDistinct>
      distinctByDescribeAnotherPerson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'describeAnotherPerson',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Reflection, Reflection, QDistinct> distinctByEmotionInBody(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'emotionInBody',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Reflection, Reflection, QDistinct>
      distinctByEmotionInfluenceActions({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'emotionInfluenceActions',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Reflection, Reflection, QDistinct> distinctByFeelSameThing(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'feelSameThing',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Reflection, Reflection, QDistinct> distinctByFirstWord(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstWord', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Reflection, Reflection, QDistinct> distinctBySecondWord(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'secondWord', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Reflection, Reflection, QDistinct> distinctByThirdWord(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'thirdWord', caseSensitive: caseSensitive);
    });
  }
}

extension ReflectionQueryProperty
    on QueryBuilder<Reflection, Reflection, QQueryProperty> {
  QueryBuilder<Reflection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Reflection, DateTime?, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<Reflection, String?, QQueryOperations>
      describeAnotherPersonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'describeAnotherPerson');
    });
  }

  QueryBuilder<Reflection, String?, QQueryOperations> emotionInBodyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'emotionInBody');
    });
  }

  QueryBuilder<Reflection, String?, QQueryOperations>
      emotionInfluenceActionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'emotionInfluenceActions');
    });
  }

  QueryBuilder<Reflection, String?, QQueryOperations> feelSameThingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'feelSameThing');
    });
  }

  QueryBuilder<Reflection, String?, QQueryOperations> firstWordProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstWord');
    });
  }

  QueryBuilder<Reflection, String?, QQueryOperations> secondWordProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'secondWord');
    });
  }

  QueryBuilder<Reflection, String?, QQueryOperations> thirdWordProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'thirdWord');
    });
  }
}
