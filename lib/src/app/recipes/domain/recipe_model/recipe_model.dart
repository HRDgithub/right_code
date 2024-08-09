import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_model.freezed.dart';
part 'recipe_model.g.dart';

@freezed
class RecipeModel with _$RecipeModel {
  factory RecipeModel({
    required int id,
    required String name,
    required String category,
    required List<String> ingredients,
    required String imgUrl,
    required DateTime createdAt,
    String? details,
  }) = _RecipeModel;

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);
}


// _$RecipeModelImpl _$$RecipeModelImplFromJson(Map<String, dynamic> json) =>
//     _$RecipeModelImpl(
//       id: (json['id'] as num).toInt(),
//       name: json['name'] as String,
//       category: json['category'] as String,
//       ingredients: (json['ingredients'] as List<dynamic>)
//           .map((e) => e as String)
//           .toList(),
//       imgUrl: json['img_url'] as String,
//       createdAt: DateTime.parse(json['created_at'] as String),
//       details: json['details'] as String?,
//     );

// Map<String, dynamic> _$$RecipeModelImplToJson(_$RecipeModelImpl instance) =>
//     <String, dynamic>{
//       'name': instance.name,
//       'category': instance.category,
//       'ingredients': instance.ingredients,
//       'img_url': instance.imgUrl,
//       'created_at': instance.createdAt.toIso8601String(),
//       'details': instance.details,
//     };
