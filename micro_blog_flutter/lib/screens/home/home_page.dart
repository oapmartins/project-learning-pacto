import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:micro_blog_flutter/controllers/feed/feed_controller.dart';
import 'package:micro_blog_flutter/util/widget/custom_button.dart';
import 'package:micro_blog_flutter/util/widget/custom_textField.dart';
import 'package:micro_blog_flutter/util/widget/util_dialog.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    FeedController _feedController = GetIt.I.get<FeedController>();
    RefreshController _refreshController =
        RefreshController(initialRefresh: false);
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
              Observer(
                builder: (_) {
                  var habilitado = _feedController.habilitadoAPostar;

                  return Card(
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CustomTextField(
                            title: 'Digite sua publicação',
                            onChanged: (value) {
                              _feedController.counteudoPublciacao = value;
                            },
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 100,
                                height: 30,
                                child: CustomButton(
                                  title: 'Publicar',
                                  background: Colors.blue,
                                  onTap: habilitado ? () {} : null,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
