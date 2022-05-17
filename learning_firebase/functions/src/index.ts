import * as functions from "firebase-functions";
import * as express from "express";
import * as admin from "firebase-admin";
import {UserService} from "./services/user_service";
import {PublicationService} from "./services/publication_service";

// Init BD
admin.initializeApp(functions.config().firebase);
const db = admin.firestore();

const usuarioExpress = express();
const userService = new UserService(db);

usuarioExpress.get("/userLogin", (req, resp) => userService.userLogin(req, resp));
usuarioExpress.post("/userRegister", (req, resp) => userService.userRegister(req, resp));
usuarioExpress.post("/userEdit", (req, resp) => userService.userEdit(req, resp));

export const usuario = functions.https.onRequest(usuarioExpress);


const postagemExpress = express();
const postagemService = new PublicationService(db);

postagemExpress.post("/manterPublicacao", (req, res) => postagemService.manterPostagem(req, res));
postagemExpress.post("/comentarPost", (req, res) => postagemService.comentaPublicacao(req, res));
postagemExpress.get("/excluirPostagem", (req, res) => postagemService.excluirPostagem(req, res));
postagemExpress.get("/excluirComentario", (req, res) => postagemService.excluirComentario(req, res));
postagemExpress.post("/darLikePost", (req, res) => postagemService.darLikePost(req, res));
postagemExpress.get("/removerLikePost", (req, res) => postagemService.removerLikePost(req, res));
postagemExpress.get("/consultarPublicacoes", (req, res) => postagemService.listaPublicacoes(req, res));

export const feed = functions.https.onRequest(postagemExpress);
