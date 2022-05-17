// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publish_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublishModel _$PublishModelFromJson(Map<String, dynamic> json) {
  return PublishModel(
    id: json['id'] as String,
    conteudo: json['conteudo'] as String,
    dataPostagem:
        UtilDateTime.convertStringToDate(json['dataPostagem'] as String),
    criador: json['criador'] == null
        ? null
        : UserModel.fromJson(json['criador'] as Map<String, dynamic>),
  )..likes = (json['likes'] as List)
      ?.map((e) =>
          e == null ? null : UserModel.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$PublishModelToJson(PublishModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conteudo': instance.conteudo,
      'dataPostagem': instance.dataPostagem?.toIso8601String(),
      'criador': instance.criador,
      'likes': instance.likes,
    };

Comentario _$ComentarioFromJson(Map<String, dynamic> json) {
  return Comentario(
    id: json['id'] as String,
    comentario: json['comentario'] as String,
    dataComentario:
        UtilDateTime.convertStringToDate(json['dataComentario'] as String),
    criador: json['criador'] == null
        ? null
        : UserModel.fromJson(json['criador'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ComentarioToJson(Comentario instance) =>
    <String, dynamic>{
      'comentario': instance.comentario,
      'id': instance.id,
      'dataComentario': instance.dataComentario?.toIso8601String(),
      'criador': instance.criador,
    };
