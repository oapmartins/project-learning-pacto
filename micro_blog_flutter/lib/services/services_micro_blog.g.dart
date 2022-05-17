// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_micro_blog.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ServicesMicroBlog implements ServicesMicroBlog {
  _ServicesMicroBlog(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://us-central1-meu-blog-curso.cloudfunctions.net';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<UtilUserReturn> userRegister(usuario) async {
    ArgumentError.checkNotNull(usuario, 'usuario');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(usuario?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/usuario/userRegister',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UtilUserReturn.fromJson(_result.data);
    return value;
  }

  @override
  Future<UtilUserReturn> userEdit(usuario) async {
    ArgumentError.checkNotNull(usuario, 'usuario');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(usuario?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/usuario/userEdit',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UtilUserReturn.fromJson(_result.data);
    return value;
  }

  @override
  Future<UtilUserReturn> userLogin(email, password) async {
    ArgumentError.checkNotNull(email, 'email');
    ArgumentError.checkNotNull(password, 'password');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'email': email,
      r'password': password
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/usuario/userLogin',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UtilUserReturn.fromJson(_result.data);
    return value;
  }

  @override
  Future<UtilPublishReturn> searchPublish() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/feed/consultarPublicacoes',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UtilPublishReturn.fromJson(_result.data);
    return value;
  }

  @override
  Future<UtilPostReturn> removeLikePost(idPublish, idUser) async {
    ArgumentError.checkNotNull(idPublish, 'idPublish');
    ArgumentError.checkNotNull(idUser, 'idUser');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'id': idPublish,
      r'idUsuario': idUser
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/feed/removerLikePost',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UtilPostReturn.fromJson(_result.data);
    return value;
  }

  @override
  Future<UtilPostReturn> addLikePost(user, idPublish) async {
    ArgumentError.checkNotNull(user, 'user');
    ArgumentError.checkNotNull(idPublish, 'idPublish');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': idPublish};
    final _data = <String, dynamic>{};
    _data.addAll(user?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/feed/darLikePost',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UtilPostReturn.fromJson(_result.data);
    return value;
  }

  @override
  Future<UtilPostReturn> removeComment(idPost, idComment) async {
    ArgumentError.checkNotNull(idPost, 'idPost');
    ArgumentError.checkNotNull(idComment, 'idComment');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'id': idPost,
      r'idComentario': idComment
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/feed/excluirComentario',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UtilPostReturn.fromJson(_result.data);
    return value;
  }

  @override
  Future<UtilPostReturn> commentPost(comment, id) async {
    ArgumentError.checkNotNull(comment, 'comment');
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': id};
    final _data = <String, dynamic>{};
    _data.addAll(comment?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/feed/comentarPost',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UtilPostReturn.fromJson(_result.data);
    return value;
  }

  @override
  Future<UtilPostReturn> removePost(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': id};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/feed/excluirPostagem',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UtilPostReturn.fromJson(_result.data);
    return value;
  }

  @override
  Future<UtilPostReturn> manterPost(publish) async {
    ArgumentError.checkNotNull(publish, 'publish');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(publish?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/feed/manterPublicacao',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UtilPostReturn.fromJson(_result.data);
    return value;
  }
}
