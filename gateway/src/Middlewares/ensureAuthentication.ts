import { Request, Response, NextFunction } from "express";
import { verify } from "jsonwebtoken";

interface IPayload {
    sub: string;   email: string; }

export function ensureAuthenticated(
    request: Request,   response: Response,   next: NextFunction
  ) {
    // Receber o token
    const authToken = request.headers.authorization;
    // Validar se token está preenchido
    if (!authToken) {
      return response.status(401).end();
    }
    const [, token] = authToken.split(" ");
    const secret = process.env.JWT_SECRET
    if(!secret){
        throw new Error('Bad Request')
    }
    try {
      const { sub } = verify (
        token,
        secret
      ) as IPayload;
      request.headers['userId'] = sub;
      return next();
    } catch (err) {
      return response.status(401).end();
    }
  }

  export function getSub(
    request: Request,   response: Response,   
  ) {
    
  }