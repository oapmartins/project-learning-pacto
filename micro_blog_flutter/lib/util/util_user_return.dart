import 'package:json_annotation/json_annotation.dart';
import 'package:micro_blog_flutter/model/user/user_model.dart';
import 'package:micro_blog_flutter/model/publish/publish_model.dart';
part 'util_user_return.g.dart';

@JsonSerializable()
class UtilUserReturn {
  UserModel success;
  UtilUserReturn({this.success});

  factory UtilUserReturn.fromJson(Map<String, dynamic> json) =>
      _$UtilUserReturnFromJson(json);

  Map<String, dynamic> toJson() => _$UtilUserReturnToJson(this);
}

@JsonSerializable()
class UtilPublishReturn {
  List<PublishModel> success;
  UtilPublishReturn({this.success});

  factory UtilPublishReturn.fromJson(Map<String, dynamic> json) =>
      _$UtilPublishReturnFromJson(json);

  Map<String, dynamic> toJson() => _$UtilPublishReturnToJson(this);
}

@JsonSerializable()
class UtilPostReturn {
  List<PublishModel> success;
  UtilPostReturn({this.success});

  factory UtilPostReturn.fromJson(Map<String, dynamic> json) =>
      _$UtilPostReturnFromJson(json);

  Map<String, dynamic> toJson() => _$UtilPostReturnToJson(this);
}
