// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Publish _$PublishFromJson(Map<String, dynamic> json) {
  return Publish(
    id: json['id'] as String,
    conteudo: json['conteudo'] as String,
    dataPostagem:
        UtilDateTime.convertStringToDate(json['dataPostagem'] as String),
    criador: json['criador'] == null
        ? null
        : UserModel.fromJson(json['criador'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PublishToJson(Publish instance) => <String, dynamic>{
      'id': instance.id,
      'conteudo': instance.conteudo,
      'dataPostagem': instance.dataPostagem?.toIso8601String(),
      'criador': instance.criador,
    };
