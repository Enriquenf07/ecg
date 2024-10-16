import express, { Request, Response, Router } from 'express';
import { userRoute } from './Controllers/userController';
import proxy from 'express-http-proxy';
import { ensureAuthenticated } from './Middlewares/ensureAuthentication';
import cors from 'cors'


const app = express();

export const route = Router()

app.use(express.json())
app.use(cors())

app.use(userRoute)
app.use(ensureAuthenticated)
app.use('/api', proxy('localhost:8080'));

app.get('/validateToken', async (req: Request, res: Response) => {
    res.json()
})


app.listen(5000, () => 'server running on port 3333')

