import 'package:get_it/get_it.dart';
import 'package:micro_blog_flutter/model/publish/publish_model.dart';
import 'package:micro_blog_flutter/services/services_micro_blog.dart';
import 'package:mobx/mobx.dart';
part 'feed_controller.g.dart';

class FeedController = FeedControllerBase with _$FeedController;

abstract class FeedControllerBase with Store {
  ServicesMicroBlog mService = GetIt.I.get<ServicesMicroBlog>();

  @observable
  ObservableList<PublishModel> mPostagens = ObservableList<PublishModel>();

  @observable
  String counteudoPublciacao = "";

  @computed
  bool get habilitadoAPostar => counteudoPublciacao.isNotEmpty;

  void consultarFeed({
    Function() success,
    Function() carregando,
    Function(String message) error,
  }) {
    carregando?.call();
    mService.searchPublish().then((responsePublicacoes) {
      mPostagens.clear();
      mPostagens.addAll(responsePublicacoes.success);
    }).catchError((onError) {
      error?.call(onError.response.data['error']);
    });
  }
}
