import { Request, Response, Router } from "express";
import { cadastro, login } from "../Service/userService";

export const userRoute = Router()


userRoute.post('/login', async (req: Request, res: Response) => {
    try{
        const {login: user, password} = req.body
        res.json(await login({userReq: user, passwordReq: password}))
    }catch(e){
        console.log(e)
        return res.status(401).json({ error: 'Unauthorized' });
    }

})

userRoute.post('/cadastro', async (req: Request, res: Response) => {
    try{
        const {login, password: senha, email} = req.body
        console.log(req.body)
        await cadastro({login, senha, email})
        console.log('oiiiiiii')
        res.status(200).json()
    }catch(e){
        console.log(e)
        return res.status(400).json();
    }

})

