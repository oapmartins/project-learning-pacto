import 'package:get_it/get_it.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:micro_blog_flutter/controllers/user/user_controller.dart';
import 'package:micro_blog_flutter/model/user/user_model.dart';
import 'package:micro_blog_flutter/util/util_date_time.dart';

part 'publish_model.g.dart';

@JsonSerializable()
class PublishModel {
  String id, conteudo;

  @JsonKey(fromJson: UtilDateTime.convertStringToDate)
  DateTime dataPostagem;
  UserModel criador;
  List<UserModel> likes;

  bool get isCriador =>
      GetIt.I.get<UserController>().mUserLoged.id.contains(criador.id);

  PublishModel({this.id, this.conteudo, this.dataPostagem, this.criador});

  factory PublishModel.fromJson(Map<String, dynamic> json) =>
      _$PublishModelFromJson(json);

  Map<String, dynamic> toJson() => _$PublishModelToJson(this);
}

@JsonSerializable()
class Comentario {
  String comentario, id;
  @JsonKey(fromJson: UtilDateTime.convertStringToDate)
  DateTime dataComentario;
  UserModel criador;

  Comentario({this.id, this.comentario, this.dataComentario, this.criador});

  factory Comentario.fromJson(Map<String, dynamic> json) =>
      _$ComentarioFromJson(json);

  Map<String, dynamic> toJson() => _$ComentarioToJson(this);
}
