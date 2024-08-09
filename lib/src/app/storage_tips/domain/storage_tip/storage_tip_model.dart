import 'package:freezed_annotation/freezed_annotation.dart';

part 'storage_tip_model.freezed.dart';
part 'storage_tip_model.g.dart';

@freezed
class StorageTipModel with _$StorageTipModel {
  factory StorageTipModel({
    required int id,
    required String name,
    required String details,
    required String category,
  }) = _StorageTipModel;

  factory StorageTipModel.fromJson(Map<String, dynamic> json) =>
      _$StorageTipModelFromJson(json);
}
