import 'package:get_it/get_it.dart';
import 'package:micro_blog_flutter/controllers/user/user_controller.dart';
import 'package:micro_blog_flutter/model/publish/publish_model.dart';
import 'package:micro_blog_flutter/services/services_micro_blog.dart';
import 'package:micro_blog_flutter/util/enum_status_consulta.dart';
import 'package:mobx/mobx.dart';
part 'feed_controller.g.dart';

class FeedController = FeedControllerBase with _$FeedController;

abstract class FeedControllerBase with Store {
  ServicesMicroBlog mService = GetIt.I.get<ServicesMicroBlog>();

  @observable
  ObservableList<PublishModel> mPostagens = ObservableList<PublishModel>();

  @observable
  StatusConsulta mStatusConsultaFeed = StatusConsulta.CARREGANDO;

  @observable
  String counteudoPublicacao = "";

  @computed
  bool get habilitadoAPostar => counteudoPublicacao.isNotEmpty;

  void consultarFeed({
    Function() success,
    Function() carregando,
    Function(String message) error,
  }) {
    carregando?.call();
    mStatusConsultaFeed = StatusConsulta.CARREGANDO;
    mService.searchPublish().then((responsePublicacoes) {
      mPostagens.clear();
      mPostagens.addAll(responsePublicacoes.success);
      mStatusConsultaFeed = StatusConsulta.SUCESSO;
      success?.call();
    }).catchError((onError) {
      mStatusConsultaFeed = StatusConsulta.FALHA;
      error?.call(onError.response.data['error']);
    });
  }

  void publicarPostagem(
    PublishModel postagem, {
    Function() success,
    Function() carregando,
    Function(String message) error,
  }) {
    if (postagem == null) {
      postagem = PublishModel(
          conteudo: counteudoPublicacao,
          criador: GetIt.I.get<UserController>().mUserLoged);
    } else {
      postagem.conteudo = counteudoPublicacao;
    }
    carregando?.call();
    mService.manterPost(postagem).then((value) {
      if (postagem.id == null) {
        mPostagens.insert(0, value.success);
      } else {
        var index = mPostagens.indexWhere((post) => post.id == postagem.id);
        mPostagens.removeAt(index);
        mPostagens.insert(index, value.success);
      }
      counteudoPublicacao = '';
      success?.call();
    }).catchError((onError) {
      mStatusConsultaFeed = StatusConsulta.FALHA;
      error?.call(onError.response.data['error']);
    });
  }

  void excluirPostagem(
    PublishModel postagem, {
    Function() success,
    Function() carregando,
    Function(String message) error,
  }) {
    carregando?.call();
    mService.removePost(postagem.id).then((value) {
      mPostagens.removeWhere((post) => post.id == postagem.id);
      success?.call();
    }).catchError((onError) {
      error?.call(onError.response.data['error']);
      mStatusConsultaFeed = StatusConsulta.FALHA;
    });
  }
}
