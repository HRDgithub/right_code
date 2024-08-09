// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecipeCategoryModel _$RecipeCategoryModelFromJson(Map<String, dynamic> json) {
  return _RecipeCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$RecipeCategoryModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeCategoryModelCopyWith<RecipeCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCategoryModelCopyWith<$Res> {
  factory $RecipeCategoryModelCopyWith(
          RecipeCategoryModel value, $Res Function(RecipeCategoryModel) then) =
      _$RecipeCategoryModelCopyWithImpl<$Res, RecipeCategoryModel>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$RecipeCategoryModelCopyWithImpl<$Res, $Val extends RecipeCategoryModel>
    implements $RecipeCategoryModelCopyWith<$Res> {
  _$RecipeCategoryModelCopyWithImpl(this._value, this._then);

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
abstract class _$$RecipeCategoryModelImplCopyWith<$Res>
    implements $RecipeCategoryModelCopyWith<$Res> {
  factory _$$RecipeCategoryModelImplCopyWith(_$RecipeCategoryModelImpl value,
          $Res Function(_$RecipeCategoryModelImpl) then) =
      __$$RecipeCategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$RecipeCategoryModelImplCopyWithImpl<$Res>
    extends _$RecipeCategoryModelCopyWithImpl<$Res, _$RecipeCategoryModelImpl>
    implements _$$RecipeCategoryModelImplCopyWith<$Res> {
  __$$RecipeCategoryModelImplCopyWithImpl(_$RecipeCategoryModelImpl _value,
      $Res Function(_$RecipeCategoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$RecipeCategoryModelImpl(
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
class _$RecipeCategoryModelImpl implements _RecipeCategoryModel {
  _$RecipeCategoryModelImpl({required this.id, required this.name});

  factory _$RecipeCategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeCategoryModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'RecipeCategoryModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeCategoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeCategoryModelImplCopyWith<_$RecipeCategoryModelImpl> get copyWith =>
      __$$RecipeCategoryModelImplCopyWithImpl<_$RecipeCategoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeCategoryModelImplToJson(
      this,
    );
  }
}

abstract class _RecipeCategoryModel implements RecipeCategoryModel {
  factory _RecipeCategoryModel(
      {required final int id,
      required final String name}) = _$RecipeCategoryModelImpl;

  factory _RecipeCategoryModel.fromJson(Map<String, dynamic> json) =
      _$RecipeCategoryModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$RecipeCategoryModelImplCopyWith<_$RecipeCategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
