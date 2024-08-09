import 'package:freezed_annotation/freezed_annotation.dart';

part 'fridge_model.freezed.dart';
part 'fridge_model.g.dart';

@freezed
class FridgeModel with _$FridgeModel {
  factory FridgeModel({
    required int id,
    required String name,
    required String category,
    required String imgUrl,
    required DateTime purchaseDate,
    required DateTime expireDate,
    required DateTime createdAt,
    required int quantity,
    required String unit,
    required String marketName,
    String? notes,
  }) = _FridgeModel;

  factory FridgeModel.fromJson(Map<String, dynamic> json) =>
      _$FridgeModelFromJson(json);
}




// _$FridgeModelImpl _$$FridgeModelImplFromJson(Map<String, dynamic> json) =>
//     _$FridgeModelImpl(
//       id: (json['id'] as num).toInt(),
//       name: json['name'] as String,
//       category: json['category'] as String,
//       imgUrl: json['img_url'] as String,
//       purchaseDate: DateTime.parse(json['purchase_date'] as String),
//       expireDate: DateTime.parse(json['expire_date'] as String),
//       createdAt: DateTime.parse(json['created_at'] as String),
//       quantity: (json['quantity'] as num).toInt(),
//       unit: json['unit'] as String,
//       marketName: json['market_name'] as String,
//       notes: json['notes'] as String?,
//     );

// Map<String, dynamic> _$$FridgeModelImplToJson(_$FridgeModelImpl instance) =>
//     <String, dynamic>{
//       'name': instance.name,
//       'category': instance.category,
//       'img_url': instance.imgUrl,
//       'purchase_date': instance.purchaseDate.toIso8601String(),
//       'expire_date': instance.expireDate.toIso8601String(),
//       'created_at': instance.createdAt.toIso8601String(),
//       'quantity': instance.quantity,
//       'unit': instance.unit,
//       'market_name': instance.marketName,
//       'notes': instance.notes,
//     };
