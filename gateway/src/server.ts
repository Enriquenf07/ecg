import express, { Request, Response, Router } from 'express';
import { userRoute } from './Controllers/userController';
import proxy from 'express-http-proxy';
import { ensureAuthenticated } from './Middlewares/ensureAuthentication';
import cors from 'cors'
import morgan from 'morgan';
import logger from './Config/logger';
import { pinoHttp } from 'pino-http';

const app = express();


export const route = Router()

app.use(express.json())
app.use(cors())
app.use(morgan('combined'))


app.use((req, res, next) => {
    next();
});

app.use(
    pinoHttp({
        logger,
        customProps: (req: any, res) => {
            return {
                username: req.userId || 'anonymous', // Log the username
            };
        },
    })
);

app.use(userRoute)
app.use(ensureAuthenticated)
app.use('/api', proxy(process.env.SPRING_HOST || '', {
    userResDecorator: function (proxyRes, proxyResData, userReq, userRes) {
        return proxyResData;
    }
}));



app.get('/validateToken', async (req: Request, res: Response) => {
    res.json()
})


app.listen(5000, () => 'server running on port 3333')

