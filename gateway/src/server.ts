import express, { Request, Response, Router } from 'express';
import { userRoute } from './Controllers/userController';
import proxy from 'express-http-proxy';
import { ensureAuthenticated } from './Middlewares/ensureAuthentication';
import cors from 'cors'
import morgan from 'morgan';


const app = express();

export const route = Router()

app.use(express.json())
app.use(cors())
app.use(morgan('combined'))

app.use((req, res, next) => {
    console.log(`${req.method} ${req.path}`);
    next();
});

console.log(process.env.DB_PASSWORD)
console.log(process.env.DB_HOST)

app.use('/app', proxy('localhost:8080', {
    userResDecorator: function (proxyRes, proxyResData, userReq, userRes) {
        console.log("Status Code", proxyRes.statusCode)
        return proxyResData;
    }
}));

app.use(userRoute)
app.use(ensureAuthenticated)
app.use('/api', proxy('spring-app:8080', {
    userResDecorator: function (proxyRes, proxyResData, userReq, userRes) {
        console.log("Status Code", proxyRes.statusCode)
        return proxyResData;
    }
}));


app.get('/validateToken', async (req: Request, res: Response) => {
    res.json()
})


app.listen(5000, () => 'server running on port 3333')

