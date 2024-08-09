import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_category_model.freezed.dart';
part 'recipe_category_model.g.dart';

@freezed
class RecipeCategoryModel with _$RecipeCategoryModel {
  factory RecipeCategoryModel({
    required int id,
    required String name,
  }) = _RecipeCategoryModel;

  factory RecipeCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeCategoryModelFromJson(json);
}
