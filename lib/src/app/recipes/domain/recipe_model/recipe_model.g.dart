// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeModelImpl _$$RecipeModelImplFromJson(Map<String, dynamic> json) =>
    _$RecipeModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      category: json['category'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      imgUrl: json['img_url'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      details: json['details'] as String?,
    );

Map<String, dynamic> _$$RecipeModelImplToJson(_$RecipeModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'category': instance.category,
      'ingredients': instance.ingredients,
      'img_url': instance.imgUrl,
      'created_at': instance.createdAt.toIso8601String(),
      'details': instance.details,
    };
