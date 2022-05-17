import {firestore} from "firebase-admin";
import {Request, Response} from "express";
import {UserModel} from "../model/user_model";
import {HttpUtil} from "../util/http_util";

export class UserService {
    private db: firestore.Firestore;

    constructor(db: firestore.Firestore) {
      this.db = db;
    }

    public userRegister(request: Request, response: Response) {
      const user: UserModel = UserModel.toUserModel(request.body);
      if (user.isValidUser()) {
        this.db.collection("usuarios").where("email", "==", user.email).get()
            .then((returnUsers) => {
              if (returnUsers.size === 0) {
                const id = this.db.collection("x").doc().id;
                user.id = id;
                return this.db.doc(`usuarios/${id}`).create(user.toJson());
              } else {
                HttpUtil.error("Usuário já cadastrado!", response);
                return null;
              }
            })
            .then((responseCreateUser) => {
              if (responseCreateUser != null) {
                HttpUtil.success(user, response);
              }
            })
            .catch((returnUsers) => {
              HttpUtil.error("Error: " + returnUsers, response);
            });
      } else {
        HttpUtil.error("Usuário inválido", response);
      }
    }

    public userLogin(request: Request, response: Response) {
      const email = request.query.email;
      const password = request.query.password;
      if (email == null || email == "" || password == null || password == "") {
        HttpUtil.error("Usuário ou senha incorretos", response);
      } else {
        this.db.collection("usuarios").where("email", "==", email).where("password", "==", password).get()
            .then((returnLogin) => {
              if (returnLogin.empty) {
                HttpUtil.error("Usuário ou senha incorretos", response);
              } else {
                const user = UserModel.toUserModel(returnLogin.docs[0].data());
                HttpUtil.success(user.toJson(), response);
              }
            })
            .catch((error) => {
              HttpUtil.error("Erro ao realizar login: " + error, response);
            });
      }
    }

    public userEdit(request: Request, response: Response) {
      const userEdit = UserModel.toUserModel(request.body);
      if (userEdit.isValidUser() && (userEdit.id != null || userEdit.id != "")) {
        this.db.doc(`usuarios/${userEdit.id}`).set(userEdit.toJson())
            .then((returnEdit) => {
              HttpUtil.success(userEdit.toJson(), response);
            })
            .catch((error) => {
              HttpUtil.error("Ocorreu um erro ao editar usuário: " + error, response);
            });
      } else {
        HttpUtil.error("Usuário inválido", response);
      }
    }
}
