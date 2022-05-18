import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:micro_blog_flutter/controllers/feed/feed_controller.dart';
import 'package:micro_blog_flutter/model/publish/publish_model.dart';
import 'package:micro_blog_flutter/util/widget/custom_button.dart';
import 'package:micro_blog_flutter/util/widget/publicacao_widget.dart';

class UtilDialog {
  static void exibirInformacao(
    BuildContext context, {
    String titulo,
    String mensagem,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Card(
              margin: EdgeInsets.all(24),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "$titulo",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Divider(),
                    Text("$mensagem"),
                    SizedBox(height: 16),
                    CustomButton(
                      title: 'Ok, entendido',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          );
        });
  }

  static void showLoading(BuildContext mainContext) {
    showDialog(
      context: mainContext,
      barrierDismissible: false,
      builder: (mainContext) {
        return Center(
          child: Card(
            margin: EdgeInsets.all(24),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }

  static void excluirPub(
    BuildContext mainContext,
    PublishModel postagem,
  ) {
    FeedController _feedController = GetIt.I.get<FeedController>();

    showDialog(
        context: mainContext,
        builder: (mainContext) {
          return Center(
            child: Card(
              margin: EdgeInsets.all(24),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Deseja Excluir?'),
                    Divider(),
                    Text(
                      "${postagem.criador.name}",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text("${postagem.conteudo}"),
                    SizedBox(height: 16),
                    Container(
                      height: 35,
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              title: 'Sim Excluir',
                              onTap: () {
                                _feedController.excluirPostagem(
                                  postagem,
                                  success: () {
                                    Navigator.pop(mainContext);
                                    exibirInformacao(
                                      mainContext,
                                      titulo: 'Sucesso',
                                      mensagem: 'A publicação foi excluída',
                                    );
                                  },
                                  carregando: () {
                                    showLoading(mainContext);
                                    Navigator.pop(mainContext);
                                  },
                                  error: (error) {
                                    Navigator.pop(mainContext);
                                    exibirInformacao(
                                      mainContext,
                                      titulo: 'Ops',
                                      mensagem: error,
                                    );
                                  },
                                );
                                Navigator.pop(mainContext);
                              },
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: CustomButton(
                              title: 'Cancelar',
                              onTap: () {
                                Navigator.pop(mainContext);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          );
        });
  }

  static void editarPub(
    BuildContext mainContext, {
    PublishModel postagem,
  }) {
    FeedController _feedController = GetIt.I.get<FeedController>();

    showDialog(
        context: mainContext,
        builder: (mainContext) {
          return Center(
            child: Card(
              margin: EdgeInsets.all(24),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Atenção você está editando!'),
                    SizedBox(height: 16),
                    Divider(),
                    PublicacaoWidget(
                      postagemEditar: postagem,
                      success: () {
                        Navigator.pop(mainContext);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
