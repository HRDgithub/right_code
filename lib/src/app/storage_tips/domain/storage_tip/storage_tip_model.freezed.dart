// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'storage_tip_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StorageTipModel _$StorageTipModelFromJson(Map<String, dynamic> json) {
  return _StorageTipModel.fromJson(json);
}

/// @nodoc
mixin _$StorageTipModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get details => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StorageTipModelCopyWith<StorageTipModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StorageTipModelCopyWith<$Res> {
  factory $StorageTipModelCopyWith(
          StorageTipModel value, $Res Function(StorageTipModel) then) =
      _$StorageTipModelCopyWithImpl<$Res, StorageTipModel>;
  @useResult
  $Res call({int id, String name, String details, String category});
}

/// @nodoc
class _$StorageTipModelCopyWithImpl<$Res, $Val extends StorageTipModel>
    implements $StorageTipModelCopyWith<$Res> {
  _$StorageTipModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? details = null,
    Object? category = null,
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
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StorageTipModelImplCopyWith<$Res>
    implements $StorageTipModelCopyWith<$Res> {
  factory _$$StorageTipModelImplCopyWith(_$StorageTipModelImpl value,
          $Res Function(_$StorageTipModelImpl) then) =
      __$$StorageTipModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String details, String category});
}

/// @nodoc
class __$$StorageTipModelImplCopyWithImpl<$Res>
    extends _$StorageTipModelCopyWithImpl<$Res, _$StorageTipModelImpl>
    implements _$$StorageTipModelImplCopyWith<$Res> {
  __$$StorageTipModelImplCopyWithImpl(
      _$StorageTipModelImpl _value, $Res Function(_$StorageTipModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? details = null,
    Object? category = null,
  }) {
    return _then(_$StorageTipModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StorageTipModelImpl implements _StorageTipModel {
  _$StorageTipModelImpl(
      {required this.id,
      required this.name,
      required this.details,
      required this.category});

  factory _$StorageTipModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StorageTipModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String details;
  @override
  final String category;

  @override
  String toString() {
    return 'StorageTipModel(id: $id, name: $name, details: $details, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StorageTipModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, details, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StorageTipModelImplCopyWith<_$StorageTipModelImpl> get copyWith =>
      __$$StorageTipModelImplCopyWithImpl<_$StorageTipModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StorageTipModelImplToJson(
      this,
    );
  }
}

abstract class _StorageTipModel implements StorageTipModel {
  factory _StorageTipModel(
      {required final int id,
      required final String name,
      required final String details,
      required final String category}) = _$StorageTipModelImpl;

  factory _StorageTipModel.fromJson(Map<String, dynamic> json) =
      _$StorageTipModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get details;
  @override
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$StorageTipModelImplCopyWith<_$StorageTipModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
