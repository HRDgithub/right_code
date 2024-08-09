// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fridge_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FridgeModel _$FridgeModelFromJson(Map<String, dynamic> json) {
  return _FridgeModel.fromJson(json);
}

/// @nodoc
mixin _$FridgeModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get imgUrl => throw _privateConstructorUsedError;
  DateTime get purchaseDate => throw _privateConstructorUsedError;
  DateTime get expireDate => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  String get marketName => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FridgeModelCopyWith<FridgeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FridgeModelCopyWith<$Res> {
  factory $FridgeModelCopyWith(
          FridgeModel value, $Res Function(FridgeModel) then) =
      _$FridgeModelCopyWithImpl<$Res, FridgeModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String category,
      String imgUrl,
      DateTime purchaseDate,
      DateTime expireDate,
      DateTime createdAt,
      int quantity,
      String unit,
      String marketName,
      String? notes});
}

/// @nodoc
class _$FridgeModelCopyWithImpl<$Res, $Val extends FridgeModel>
    implements $FridgeModelCopyWith<$Res> {
  _$FridgeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? imgUrl = null,
    Object? purchaseDate = null,
    Object? expireDate = null,
    Object? createdAt = null,
    Object? quantity = null,
    Object? unit = null,
    Object? marketName = null,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseDate: null == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expireDate: null == expireDate
          ? _value.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      marketName: null == marketName
          ? _value.marketName
          : marketName // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FridgeModelImplCopyWith<$Res>
    implements $FridgeModelCopyWith<$Res> {
  factory _$$FridgeModelImplCopyWith(
          _$FridgeModelImpl value, $Res Function(_$FridgeModelImpl) then) =
      __$$FridgeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String category,
      String imgUrl,
      DateTime purchaseDate,
      DateTime expireDate,
      DateTime createdAt,
      int quantity,
      String unit,
      String marketName,
      String? notes});
}

/// @nodoc
class __$$FridgeModelImplCopyWithImpl<$Res>
    extends _$FridgeModelCopyWithImpl<$Res, _$FridgeModelImpl>
    implements _$$FridgeModelImplCopyWith<$Res> {
  __$$FridgeModelImplCopyWithImpl(
      _$FridgeModelImpl _value, $Res Function(_$FridgeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? imgUrl = null,
    Object? purchaseDate = null,
    Object? expireDate = null,
    Object? createdAt = null,
    Object? quantity = null,
    Object? unit = null,
    Object? marketName = null,
    Object? notes = freezed,
  }) {
    return _then(_$FridgeModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: null == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseDate: null == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expireDate: null == expireDate
          ? _value.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      marketName: null == marketName
          ? _value.marketName
          : marketName // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FridgeModelImpl implements _FridgeModel {
  _$FridgeModelImpl(
      {required this.id,
      required this.name,
      required this.category,
      required this.imgUrl,
      required this.purchaseDate,
      required this.expireDate,
      required this.createdAt,
      required this.quantity,
      required this.unit,
      required this.marketName,
      this.notes});

  factory _$FridgeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FridgeModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String category;
  @override
  final String imgUrl;
  @override
  final DateTime purchaseDate;
  @override
  final DateTime expireDate;
  @override
  final DateTime createdAt;
  @override
  final int quantity;
  @override
  final String unit;
  @override
  final String marketName;
  @override
  final String? notes;

  @override
  String toString() {
    return 'FridgeModel(id: $id, name: $name, category: $category, imgUrl: $imgUrl, purchaseDate: $purchaseDate, expireDate: $expireDate, createdAt: $createdAt, quantity: $quantity, unit: $unit, marketName: $marketName, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FridgeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl) &&
            (identical(other.purchaseDate, purchaseDate) ||
                other.purchaseDate == purchaseDate) &&
            (identical(other.expireDate, expireDate) ||
                other.expireDate == expireDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.marketName, marketName) ||
                other.marketName == marketName) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, category, imgUrl,
      purchaseDate, expireDate, createdAt, quantity, unit, marketName, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FridgeModelImplCopyWith<_$FridgeModelImpl> get copyWith =>
      __$$FridgeModelImplCopyWithImpl<_$FridgeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FridgeModelImplToJson(
      this,
    );
  }
}

abstract class _FridgeModel implements FridgeModel {
  factory _FridgeModel(
      {required final int id,
      required final String name,
      required final String category,
      required final String imgUrl,
      required final DateTime purchaseDate,
      required final DateTime expireDate,
      required final DateTime createdAt,
      required final int quantity,
      required final String unit,
      required final String marketName,
      final String? notes}) = _$FridgeModelImpl;

  factory _FridgeModel.fromJson(Map<String, dynamic> json) =
      _$FridgeModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get category;
  @override
  String get imgUrl;
  @override
  DateTime get purchaseDate;
  @override
  DateTime get expireDate;
  @override
  DateTime get createdAt;
  @override
  int get quantity;
  @override
  String get unit;
  @override
  String get marketName;
  @override
  String? get notes;
  @override
  @JsonKey(ignore: true)
  _$$FridgeModelImplCopyWith<_$FridgeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
