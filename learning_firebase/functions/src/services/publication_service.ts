import { firestore } from "firebase-admin";
import { Request, Response } from "express";
import { HttpUtil } from "../util/http_util";
import { Comentario, Publication } from "../model/publication";

export class PublicationService {
    private db: firestore.Firestore;

    constructor(db: firestore.Firestore) {
        this.db = db;
    }

    public manterPostagem(request: Request, response: Response) {

        if (request.body === undefined) {
            request.body = {};
        }

        let postagem = Publication.toPublication(request.body);
        if (postagem.isValid()) {
            if (postagem.id == undefined) {
                postagem.id = this.db.collection('x').doc().id;
                postagem.dataPostagem = new Date();
            } else {
                postagem.dataPostagem = undefined;
            }
            this.db.doc(`publicacoes/${postagem.id}`).set(postagem.toJson(), { merge: true })
                .then(resultadoSnap => {
                    HttpUtil.success(postagem.toJson(), response);
                }).catch(error => {
                    HttpUtil.error('Postagem inválida: ' + error, response);
                });

        } else {
            HttpUtil.error('Postagem inválida.', response);
        }
    }

    public comentaPublicacao(request: Request, response: Response) {
        const idPostagem = request.query.id;
        const comentario = Comentario.toComentario(request.body);



        if (idPostagem === undefined || idPostagem === '') {
            HttpUtil.error('O parâmetro ID não pode ser nulo', response);
        } else if (!comentario.isValid()) {
            HttpUtil.error('O comentário deve ser preenchido', response);
        } else {
            this.db.doc(`publicacoes/${idPostagem}`).get()
                .then(postSnap => {
                    const post = Publication.toPublication(postSnap.data());
                    comentario.dataComentario = new Date();
                    if(post.comentarios == undefined) post.comentarios = [];
                    post.comentarios.push(comentario);
                    postSnap.ref.set(post.toJson(), {merge: true});
                    HttpUtil.success(post.toJson(), response);
                })
                .catch(error => {
                    HttpUtil.error('Ocorreu uma falha ao tentar realizar inserir: ' + error, response);

                });
        }
    }

}