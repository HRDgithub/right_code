// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_tip_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StorageTipModelImpl _$$StorageTipModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StorageTipModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      details: json['details'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$$StorageTipModelImplToJson(
        _$StorageTipModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'details': instance.details,
      'category': instance.category,
    };
