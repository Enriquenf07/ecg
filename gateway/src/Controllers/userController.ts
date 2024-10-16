import { Request, Response, Router } from "express";
import { login } from "../Service/userService";

export const userRoute = Router()


userRoute.post('/login', async (req: Request, res: Response) => {
    try{
        const {login: user, password} = req.body
        res.json(await login({userReq: user, passwordReq: password}))
    }catch(e){
        return res.status(401).json({ error: 'Unauthorized' });
    }

})

