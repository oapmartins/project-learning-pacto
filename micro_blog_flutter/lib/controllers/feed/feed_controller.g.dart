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

  final _$counteudoPublciacaoAtom =
      Atom(name: 'FeedControllerBase.counteudoPublciacao');

  @override
  String get counteudoPublciacao {
    _$counteudoPublciacaoAtom.reportRead();
    return super.counteudoPublciacao;
  }

  @override
  set counteudoPublciacao(String value) {
    _$counteudoPublciacaoAtom.reportWrite(value, super.counteudoPublciacao, () {
      super.counteudoPublciacao = value;
    });
  }

  @override
  String toString() {
    return '''
counteudoPublciacao: ${counteudoPublciacao},
habilitadoAPostar: ${habilitadoAPostar}
    ''';
  }
}
