import {UserModel} from "./user_model";

export class Publication {
    id?: string;
    conteudo?: string;
    dataPostagem?: Date;
    criador?: UserModel;
    likes?: UserModel[];
    comentarios?: Comentario[];


    constructor(
        id?: string,
        conteudo?: string,
        dataPostagem?: Date,
        criador?: UserModel,
        likes?: UserModel[],
        comentarios?: Comentario[],
    ) {
      this.id = id;
      this.conteudo = conteudo;
      this.dataPostagem = dataPostagem;
      this.criador = criador;
      this.likes = likes;
      this.comentarios = comentarios;
    }

    public isValid(): boolean {
      return this.conteudo !== undefined && this.criador !== undefined;
    }

    static toPublication(json: any = {}): Publication {
      return new Publication(json.id, json.conteudo, new Date(json.dataPostagem), UserModel.toUserModel(json.criador), json.likes, json.comentarios);
    }

    public toJson(): any {
      return JSON.parse(JSON.stringify(this));
    }
}

export class Comentario {
    id?: string;
    criador?: UserModel;
    comentario?: string;
    dataComentario?: Date;

    constructor(criador?: UserModel, comentario?: string, dataComentario?: Date, id?: string) {
      this.criador = criador;
      this.comentario = comentario;
      this.dataComentario = dataComentario;
      this.id = id;
    }

    public isValid(): boolean {
      return this.criador !== undefined && this.comentario != undefined && this.comentario != "";
    }

    static toComentario(json: any): Comentario {
      return new Comentario(UserModel.toUserModel(json.criador), json.comentario, json.dataComentario);
    }

    public toJson(): any {
      return JSON.parse(JSON.stringify(this));
    }
}
