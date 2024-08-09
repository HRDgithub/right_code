// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fridge_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FridgeCategoryModel _$FridgeCategoryModelFromJson(Map<String, dynamic> json) {
  return _FridgeCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$FridgeCategoryModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FridgeCategoryModelCopyWith<FridgeCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FridgeCategoryModelCopyWith<$Res> {
  factory $FridgeCategoryModelCopyWith(
          FridgeCategoryModel value, $Res Function(FridgeCategoryModel) then) =
      _$FridgeCategoryModelCopyWithImpl<$Res, FridgeCategoryModel>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$FridgeCategoryModelCopyWithImpl<$Res, $Val extends FridgeCategoryModel>
    implements $FridgeCategoryModelCopyWith<$Res> {
  _$FridgeCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FridgeCategoryModelImplCopyWith<$Res>
    implements $FridgeCategoryModelCopyWith<$Res> {
  factory _$$FridgeCategoryModelImplCopyWith(_$FridgeCategoryModelImpl value,
          $Res Function(_$FridgeCategoryModelImpl) then) =
      __$$FridgeCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$FridgeCategoryModelImplCopyWithImpl<$Res>
    extends _$FridgeCategoryModelCopyWithImpl<$Res, _$FridgeCategoryModelImpl>
    implements _$$FridgeCategoryModelImplCopyWith<$Res> {
  __$$FridgeCategoryModelImplCopyWithImpl(_$FridgeCategoryModelImpl _value,
      $Res Function(_$FridgeCategoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$FridgeCategoryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FridgeCategoryModelImpl implements _FridgeCategoryModel {
  _$FridgeCategoryModelImpl({required this.id, required this.name});

  factory _$FridgeCategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FridgeCategoryModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'FridgeCategoryModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FridgeCategoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FridgeCategoryModelImplCopyWith<_$FridgeCategoryModelImpl> get copyWith =>
      __$$FridgeCategoryModelImplCopyWithImpl<_$FridgeCategoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FridgeCategoryModelImplToJson(
      this,
    );
  }
}

abstract class _FridgeCategoryModel implements FridgeCategoryModel {
  factory _FridgeCategoryModel(
      {required final int id,
      required final String name}) = _$FridgeCategoryModelImpl;

  factory _FridgeCategoryModel.fromJson(Map<String, dynamic> json) =
      _$FridgeCategoryModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$FridgeCategoryModelImplCopyWith<_$FridgeCategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
