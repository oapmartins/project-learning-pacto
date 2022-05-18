import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:micro_blog_flutter/controllers/feed/feed_controller.dart';
import 'package:micro_blog_flutter/model/publish/publish_model.dart';
import 'package:micro_blog_flutter/util/widget/util_dialog.dart';

import 'custom_button.dart';
import 'custom_textField.dart';

class PublicacaoWidget extends StatefulWidget {
  final PublishModel postagemEditar;
  final Function() success;
  const PublicacaoWidget({Key key, this.postagemEditar, this.success})
      : super(key: key);

  @override
  State<PublicacaoWidget> createState() => _PublicacaoWidgetState();
}

class _PublicacaoWidgetState extends State<PublicacaoWidget> {
  FeedController _feedController = GetIt.I.get<FeedController>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomTextField(
              title: widget.postagemEditar != null
                  ? 'Editar Publicação'
                  : 'Digite sua publicação',
              value: widget.postagemEditar?.conteudo ??
                  _feedController.counteudoPublicacao,
              onChanged: (value) {
                _feedController.counteudoPublicacao = value;
              },
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Observer(
                  builder: (_) {
                    var habilitado = _feedController.habilitadoAPostar;

                    return Container(
                      width: 100,
                      height: 30,
                      child: CustomButton(
                        title: widget.postagemEditar != null
                            ? 'Editar'
                            : 'Publicar',
                        background: Colors.blue,
                        onTap: habilitado
                            ? () {
                                _feedController.publicarPostagem(
                                  widget.postagemEditar,
                                  success: () {
                                    Navigator.pop(context);
                                    setState(() {});
                                    if (widget.success != null) {
                                      widget.success();
                                    }
                                  },
                                  error: (error) {
                                    Navigator.pop(context);
                                    UtilDialog.exibirInformacao(
                                      context,
                                      titulo: 'Ops!',
                                      mensagem: error,
                                    );
                                  },
                                  carregando: () {
                                    UtilDialog.showLoading(context);
                                  },
                                );
                              }
                            : null,
                      ),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
