// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'util_user_return.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UtilUserReturn _$UtilUserReturnFromJson(Map<String, dynamic> json) {
  return UtilUserReturn(
    success: json['success'] == null
        ? null
        : UserModel.fromJson(json['success'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UtilUserReturnToJson(UtilUserReturn instance) =>
    <String, dynamic>{
      'success': instance.success,
    };

UtilPublishReturn _$UtilPublishReturnFromJson(Map<String, dynamic> json) {
  return UtilPublishReturn(
    success: (json['success'] as List)
        ?.map((e) =>
            e == null ? null : PublishModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UtilPublishReturnToJson(UtilPublishReturn instance) =>
    <String, dynamic>{
      'success': instance.success,
    };

UtilPostReturn _$UtilPostReturnFromJson(Map<String, dynamic> json) {
  return UtilPostReturn(
    success: json['success'] == null
        ? null
        : PublishModel.fromJson(json['success'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UtilPostReturnToJson(UtilPostReturn instance) =>
    <String, dynamic>{
      'success': instance.success,
    };
