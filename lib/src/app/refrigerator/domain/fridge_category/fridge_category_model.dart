import 'package:freezed_annotation/freezed_annotation.dart';

part 'fridge_category_model.freezed.dart';
part 'fridge_category_model.g.dart';

@freezed
class FridgeCategoryModel with _$FridgeCategoryModel {
  factory FridgeCategoryModel({
    required int id,
    required String name,
  }) = _FridgeCategoryModel;

  factory FridgeCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$FridgeCategoryModelFromJson(json);
}
