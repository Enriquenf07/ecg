import express, { Request, Response, Router } from 'express';
import { userRoute } from './Controllers/userController';
import proxy from 'express-http-proxy';
import { ensureAuthenticated } from './Middlewares/ensureAuthentication';
import cors from 'cors'
import morgan from 'morgan';
import { pinoHttp } from 'pino-http';
import { getById } from './Service/userService';
import { morganMiddleware } from './Config/logger';


const app = express();


export const route = Router()

app.use(express.json())
app.use(cors())



app.use((req, res, next) => {
    next();
});



app.use(userRoute)
app.use(ensureAuthenticated)
app.use(morganMiddleware)
app.use('/api', proxy(process.env.SPRING_HOST || '', {
    userResDecorator: function (proxyRes, proxyResData, userReq, userRes) {
        return proxyResData;
    }
}));



app.get('/validateToken', async (req: Request, res: Response) => {
    res.json()
})


app.listen(5000, () => 'server running on port 3333')

