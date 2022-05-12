import { Response } from "express";

export class HttpUtil {
    static success(msg: any, response: Response): any {
        return response.send({
            'success': msg
        });
    }

    static error(msg: any, response: Response): any {
        return response.status(500).send({
            'error': msg
        });
    }
}