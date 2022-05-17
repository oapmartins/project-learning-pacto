import {firestore} from "firebase-admin";
import {Request, Response} from "express";
import {HttpUtil} from "../util/http_util";
import {Comentario, Publication} from "../model/publication";
import {UserModel} from "../model/user_model";

export class PublicationService {
    private db: firestore.Firestore;

    constructor(db: firestore.Firestore) {
      this.db = db;
    }

    public manterPostagem(request: Request, response: Response) {
      if (request.body === undefined) {
        request.body = {};
      }

      const postagem = Publication.toPublication(request.body);
      if (postagem.isValid()) {
        if (postagem.id == undefined) {
          postagem.id = this.db.collection("x").doc().id;
          postagem.dataPostagem = new Date();
        } else {
          postagem.dataPostagem = undefined;
        }
        this.db.doc(`publicacoes/${postagem.id}`).set(postagem.toJson(), {merge: true})
            .then((resultadoSnap) => {
              HttpUtil.success(postagem.toJson(), response);
            }).catch((error) => {
              HttpUtil.error("Postagem inválida: " + error, response);
            });
      } else {
        HttpUtil.error("Postagem inválida.", response);
      }
    }

    public comentaPublicacao(request: Request, response: Response) {
      const idPostagem = request.query.id;
      const comentario = Comentario.toComentario(request.body);
      let post: Publication;


      if (idPostagem === undefined || idPostagem === "") {
        HttpUtil.error("O parâmetro ID não pode ser nulo", response);
      } else if (!comentario.isValid()) {
        HttpUtil.error("O comentário deve ser preenchido", response);
      } else {
        this.db.doc(`publicacoes/${idPostagem}`).get()
            .then((postSnap) => {
              post = Publication.toPublication(postSnap.data());
              comentario.dataComentario = new Date();
              comentario.id = this.db.collection("x").doc().id;
              if (post.comentarios == undefined) post.comentarios = [];
              post.comentarios.push(comentario);
              return postSnap.ref.set(post.toJson(), {merge: true});
            }).then((_) => {
              HttpUtil.success(post.toJson(), response);
            })
            .catch((error) => {
              HttpUtil.error("Ocorreu uma falha ao tentar realizar inserir: " + error, response);
            });
      }
    }

    public excluirPostagem(request: Request, response: Response) {
      if (request.query.id === undefined || request.query.id === "") {
        HttpUtil.error("Post inválido", response);
      } else {
        this.db.doc(`publicacoes/${request.query.id}`).delete().then((_) => {
          HttpUtil.success("Post excluído", response);
        })
            .catch((error) => {
              HttpUtil.error("Ocorreu um erro ao excluir post: " + error, response);
            });
      }
    }

    public excluirComentario(request: Request, response: Response) {
      const idPostagem = request.query.id;
      const idComentario = request.query.idComentario;
      let postagem: Publication;
      if (idPostagem === undefined || idPostagem === "" || idComentario === undefined || idComentario === "") {
        HttpUtil.error("Post ou comentário inválido", response);
      } else {
        this.db.doc(`publicacoes/${idPostagem}`).get()
            .then((postSnap) => {
              postagem = Publication.toPublication(postSnap.data());
              postagem.comentarios = postagem.comentarios?.filter((c) => c.id !== idComentario);
              return postSnap.ref.set(postagem.toJson());
            })
            .then((_) => {
              HttpUtil.success(postagem.toJson(), response);
            })
            .catch((error) => {
              HttpUtil.error("Ocorreu um erro ao excluir Comentário: " + error, response);
            });
      }
    }

    public darLikePost(request: Request, response: Response) {
      const idPostagem = request.query.id;
      const like = UserModel.toUserModel(request.body);
      let postagem: Publication;
      if (idPostagem === undefined || idPostagem === "" || like === undefined) {
        HttpUtil.error("O like não pode ser dado, pois o ID está vazio", response);
      } else {
        this.db.doc(`publicacoes/${idPostagem}`).get()
            .then((postSnap) => {
              postagem = Publication.toPublication(postSnap.data());
              if (postagem.likes === undefined) postagem.likes = [];
              postagem.likes.push(like);
              return postSnap.ref.set(postagem.toJson());
            })
            .then((_) => {
              HttpUtil.success(postagem.toJson(), response);
            })
            .catch((error) => {
              HttpUtil.error("Ocorreu um erro ao dar like: " + error, response);
            });
      }
    }

    public removerLikePost(request: Request, response: Response) {
      const idPostagem = request.query.id;
      const idUsuario = request.query.idUsuario;
      let postagem: Publication;
      if (idPostagem === undefined || idPostagem === "" || idUsuario === undefined || idUsuario === "") {
        HttpUtil.error("Não é possível remover o like, ID ou Usuário vazios", response);
      } else {
        this.db.doc(`publicacoes/${idPostagem}`).get()
            .then((postSnap) => {
              postagem = Publication.toPublication(postSnap.data());
              if (postagem.likes === undefined) postagem.likes = [];
              postagem.likes = postagem.likes?.filter((l) => l.id !== idUsuario);
              return postSnap.ref.set(postagem.toJson());
            })
            .then((_) => {
              HttpUtil.success(postagem.toJson(), response);
            })
            .catch((error) => {
              HttpUtil.error("Ocorreu um erro ao remover like: " + error, response);
            });
      }
    }

    public listaPublicacoes(request: Request, response: Response) {
      this.db.collection("publicacoes").orderBy("dataPostagem", "desc").get()
          .then((postagemSnap) => {
            const listaPublicacoes: Publication[] = [];
            postagemSnap.forEach((postSnap) => {
              listaPublicacoes.push(Publication.toPublication(postSnap.data()));
            });
            HttpUtil.success(listaPublicacoes, response);
          })
          .catch((error) => {
            HttpUtil.error("Ocorreu um erro ao consultar publicações!: " + error, response);
          });
    }
}
