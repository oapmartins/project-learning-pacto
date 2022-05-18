// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FeedController on FeedControllerBase, Store {
  Computed<bool> _$habilitadoAPostarComputed;

  @override
  bool get habilitadoAPostar => (_$habilitadoAPostarComputed ??= Computed<bool>(
          () => super.habilitadoAPostar,
          name: 'FeedControllerBase.habilitadoAPostar'))
      .value;

  final _$mPostagensAtom = Atom(name: 'FeedControllerBase.mPostagens');

  @override
  ObservableList<PublishModel> get mPostagens {
    _$mPostagensAtom.reportRead();
    return super.mPostagens;
  }

  @override
  set mPostagens(ObservableList<PublishModel> value) {
    _$mPostagensAtom.reportWrite(value, super.mPostagens, () {
      super.mPostagens = value;
    });
  }

  final _$mStatusConsultaFeedAtom =
      Atom(name: 'FeedControllerBase.mStatusConsultaFeed');

  @override
  StatusConsulta get mStatusConsultaFeed {
    _$mStatusConsultaFeedAtom.reportRead();
    return super.mStatusConsultaFeed;
  }

  @override
  set mStatusConsultaFeed(StatusConsulta value) {
    _$mStatusConsultaFeedAtom.reportWrite(value, super.mStatusConsultaFeed, () {
      super.mStatusConsultaFeed = value;
    });
  }

  final _$counteudoPublicacaoAtom =
      Atom(name: 'FeedControllerBase.counteudoPublicacao');

  @override
  String get counteudoPublicacao {
    _$counteudoPublicacaoAtom.reportRead();
    return super.counteudoPublicacao;
  }

  @override
  set counteudoPublicacao(String value) {
    _$counteudoPublicacaoAtom.reportWrite(value, super.counteudoPublicacao, () {
      super.counteudoPublicacao = value;
    });
  }

  @override
  String toString() {
    return '''
mPostagens: ${mPostagens},
mStatusConsultaFeed: ${mStatusConsultaFeed},
counteudoPublicacao: ${counteudoPublicacao},
habilitadoAPostar: ${habilitadoAPostar}
    ''';
  }
}
