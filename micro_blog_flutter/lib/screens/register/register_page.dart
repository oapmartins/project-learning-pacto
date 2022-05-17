import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:micro_blog_flutter/controllers/user/user_controller.dart';
import 'package:micro_blog_flutter/util/widget/custom_button.dart';
import 'package:micro_blog_flutter/model/user/user_model.dart';
import 'package:micro_blog_flutter/util/widget/custom_textField.dart';
import 'package:micro_blog_flutter/util/widget/util_dialog.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  UserController _userController = GetIt.I.get<UserController>();
  UserModel _user = UserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro Micro-Blog'),
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
                Text('Faça já o seu cadastro'),
                Divider(),
                CustomTextField(
                  title: 'E-mail',
                  onChanged: (value) => _user.email = value,
                ),
                CustomTextField(
                  title: 'Nome',
                  onChanged: (value) => _user.name = value,
                ),
                CustomTextField(
                  title: 'Senha',
                  obscureText: true,
                  onChanged: (value) => _user.password = value,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.maxFinite,
                  height: 50,
                  child: CustomButton(
                    title: 'Registrar',
                    onTap: () {
                      _userController.userRegister(_user, success: () {
                        Navigator.pushReplacementNamed(context, '/homePage');
                      }, error: (message) {
                        UtilDialog.exibirInformacao(
                          context,
                          titulo: 'Ops!',
                          mensagem: message,
                        );
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
