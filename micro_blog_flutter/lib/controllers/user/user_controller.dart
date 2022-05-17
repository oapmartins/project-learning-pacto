import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:micro_blog_flutter/services/services_micro_blog.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:micro_blog_flutter/model/user/user_model.dart';
part 'user_controller.g.dart';

class UserController = UserControllerBase with _$UserController;

abstract class UserControllerBase with Store {
  UserModel mUserLoged;
  ServicesMicroBlog mService = GetIt.I.get<ServicesMicroBlog>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void verifyExistsUser({Function existsUser, Function dontExistsUser}) {
    _prefs.then((db) {
      var userJson = db.getString('user');
      if (userJson != null) {
        mUserLoged = UserModel.fromJson(jsonDecode(userJson));
        existsUser?.call();
      } else {
        dontExistsUser?.call();
      }
    });
  }

  void userRegister(
    UserModel userRegister, {
    Function() success,
    Function(String message) error,
  }) {
    if (userRegister.email?.isEmpty ?? true) {
      error?.call('E-mail inválido');
    } else if (userRegister.password?.isEmpty ?? true) {
      error?.call('Defina sua senha');
    } else if (userRegister.name?.isEmpty ?? true) {
      error?.call('Defina seu nome');
    }
    mService.userRegister(userRegister).then((user) {
      _prefs.then((db) {
        db.setString('user', jsonEncode(user.toJson()));
        success?.call();
      });
    }).catchError((error) {
      error?.call(error.message);
    });
  }

  void userLogin(
    UserModel userLogin, {
    Function() success,
    Function(String message) error,
  }) {
    if ((userLogin.email?.isEmpty ?? true) ||
        (userLogin.password?.isEmpty ?? true)) {
      error?.call('Usuário ou Senha inválidos!');
    } else {
      mService.userLogin(userLogin.email, userLogin.password).then((user) {
        _prefs.then((db) {
          db.setString('user', jsonEncode(user.toJson()));
          success?.call();
        });
      }).catchError((error) {
        error?.call(error.message);
      });
    }
  }
}
