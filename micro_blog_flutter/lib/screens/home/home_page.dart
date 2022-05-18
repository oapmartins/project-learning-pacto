import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:micro_blog_flutter/controllers/feed/feed_controller.dart';
import 'package:micro_blog_flutter/util/enum_status_consulta.dart';
import 'package:micro_blog_flutter/util/util_date_time.dart';
import 'package:micro_blog_flutter/util/widget/custom_button.dart';
import 'package:micro_blog_flutter/util/widget/custom_textField.dart';
import 'package:micro_blog_flutter/util/widget/publicacao_widget.dart';
import 'package:micro_blog_flutter/util/widget/util_dialog.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin<HomePage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  FeedController _feedController = GetIt.I.get<FeedController>();

  BuildContext mMainContext;

  _consultarFeed() {
    _feedController.consultarFeed(
      success: () {
        Navigator.pop(context);
        _refreshController.refreshCompleted();
      },
      error: (error) {
        Navigator.pop(context);
        _refreshController.refreshFailed();
      },
      carregando: () {
        UtilDialog.showLoading(context);
      },
    );
  }

  @override
  void initState() {
    mMainContext = context;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Principal'),
      ),
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _consultarFeed,
        header: WaterDropHeader(),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              PublicacaoWidget(),
              Observer(
                // ignore: missing_return
                builder: (_) {
                  switch (_feedController.mStatusConsultaFeed) {
                    case StatusConsulta.CARREGANDO:
                      return Text('Aguarde, estou consultando!');
                      break;
                    case StatusConsulta.SUCESSO:
                      return ListView.builder(
                        primary: false,
                        itemBuilder: (context, index) {
                          var post = _feedController.mPostagens[index];
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('${post.criador.name}'),
                                      Visibility(
                                        visible: post.isCriador,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(
                                                icon: Icon(Icons.edit),
                                                onPressed: () {
                                                  UtilDialog.editarPub(
                                                    mMainContext,
                                                    postagem: post,
                                                  );
                                                }),
                                            IconButton(
                                              icon: Icon(Icons.delete),
                                              onPressed: () {
                                                UtilDialog.excluirPub(
                                                  mMainContext,
                                                  post,
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  Text('${post.conteudo}'),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(height: 10),
                                        Text(
                                          post.dataPostagem != null
                                              ? UtilDateTime.convertDateTime(
                                                  post.dataPostagem,
                                                )
                                              : '',
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: _feedController.mPostagens.length,
                        shrinkWrap: true,
                      );
                      break;
                    case StatusConsulta.FALHA:
                      return Text('Ops, não consegui carregar!');
                      break;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    _consultarFeed();
  }
}
