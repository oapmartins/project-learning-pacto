import 'package:micro_blog_flutter/model/publish/publish_model.dart';
import 'package:micro_blog_flutter/util/util_user_return.dart';
import 'package:retrofit/retrofit.dart';
import 'package:micro_blog_flutter/model/user/user_model.dart';
import 'package:dio/dio.dart';

part 'services_micro_blog.g.dart';

@RestApi(baseUrl: "https://us-central1-meu-blog-curso.cloudfunctions.net")
abstract class ServicesMicroBlog {
  factory ServicesMicroBlog(Dio dio, {String baseUrl}) = _ServicesMicroBlog;

  @POST("/usuario/userRegister")
  Future<UtilUserReturn> userRegister(@Body() UserModel usuario);

  @POST("/usuario/userEdit")
  Future<UtilUserReturn> userEdit(@Body() UserModel usuario);

  @GET("/usuario/userLogin")
  Future<UtilUserReturn> userLogin(
    @Query('email') String email,
    @Query('password') String password,
  );

  @GET("/feed/consultarPublicacoes")
  Future<UtilPublishReturn> searchPublish();

  @GET("/feed/removerLikePost")
  Future<UtilPostReturn> removeLikePost(
    @Query('id') String idPublish,
    @Query('idUsuario') String idUser,
  );

  @POST("/feed/darLikePost")
  Future<UtilPostReturn> addLikePost(
    @Body() UserModel user,
    @Query('id') String idPublish,
  );

  @GET("/feed/excluirComentario")
  Future<UtilPostReturn> removeComment(
    @Query('id') String idPost,
    @Query('idComentario') String idComment,
  );

  @POST("/feed/comentarPost")
  Future<UtilPostReturn> commentPost(
    @Body() Comentario comment,
    @Query('id') String id,
  );

  @GET("/feed/excluirPostagem")
  Future<UtilPostReturn> removePost(
    @Query('id') String id,
  );

  @POST("/feed/manterPublicacao")
  Future<UtilPostReturn> manterPost(@Body() PublishModel publish);
}
