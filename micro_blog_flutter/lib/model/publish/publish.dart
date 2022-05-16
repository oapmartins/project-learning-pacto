import 'package:json_annotation/json_annotation.dart';
import 'package:micro_blog_flutter/model/user/user_model.dart';
import 'package:micro_blog_flutter/util/util_date_time.dart';

part 'publish.g.dart';

@JsonSerializable()
class Publish {
  String id, conteudo;

  @JsonKey(fromJson: UtilDateTime.convertStringToDate)
  DateTime dataPostagem;
  UserModel criador;

  Publish({this.id, this.conteudo, this.dataPostagem, this.criador});

  factory Publish.fromJson(Map<String, dynamic> json) =>
      _$PublishFromJson(json);

  Map<String, dynamic> toJson() => _$PublishToJson(this);
}
