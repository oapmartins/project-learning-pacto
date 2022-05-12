export class UserModel {
    name?: String;
    email?: String;
    password?: String;
    id?: String;

    constructor(name?: string, email?: string, password?: string, id?: string) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.id = id;
    }

    public isValidUser() : boolean{
        return this.email !== null && this.email !== '' && this.email !== undefined && 
               this.password !== null && this.password !== '' && this.password !== undefined;
    }

    static toUserModel(json: any = {}): UserModel{
        return new UserModel(json.name, json.email, json.password, json.id);
    }

    public toJson(): any{
        return JSON.parse(JSON.stringify(this));
    }
}