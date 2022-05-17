import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:micro_blog_flutter/controllers/user/user_controller.dart';
import 'package:micro_blog_flutter/util/widget/custom_button.dart';
import 'package:micro_blog_flutter/util/widget/custom_textField.dart';
import 'package:micro_blog_flutter/model/user/user_model.dart';
import 'package:micro_blog_flutter/util/widget/util_dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserController _userController = GetIt.I.get<UserController>();
  UserModel _user = UserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Micro-Blog'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                Text('Faça o Login!'),
                Divider(),
                CustomTextField(
                  title: 'Email',
                  onChanged: (value) => _user.email = value,
                ),
                CustomTextField(
                  title: 'Senha',
                  obscureText: true,
                  onChanged: (value) => _user.password = value,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomButton(
                  title: 'Entrar',
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/homePage');

                    _userController.userLogin(
                      _user,
                      success: () {
                        Navigator.pushReplacementNamed(context, '/homePage');
                      },
                      error: (message) {
                        UtilDialog.exibirInformacao(context,
                            titulo: 'Ops!', mensagem: message);
                      },
                    );
                  },
                ),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Text('Ou'),
                    Expanded(child: Divider()),
                  ],
                ),
                CustomButton(
                  title: 'Me Cadastrar',
                  onTap: () {
                    Navigator.pushNamed(context, '/registerPage');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
