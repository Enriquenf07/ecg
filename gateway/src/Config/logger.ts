import morgan from 'morgan';
import winston from 'winston';
import { getById } from '../Service/userService';

const { combine, timestamp, json } = winston.format;

async function createLogger(req: any) {
    const user = await getById(req.headers.userId); // fetch user asynchronously

    return winston.createLogger({
        level: 'http',
        defaultMeta: { user, status: req.res.statusCode },
        format: winston.format.combine(
            winston.format.timestamp({
                format: 'YYYY-MM-DD hh:mm:ss',
            }),
            winston.format.json()
        ),
        transports: [new winston.transports.Console()],
    });
}

// Middleware for logging with morgan
export const morganMiddleware = async (req: any, res: any, next: any) => {
    const logger = await createLogger(req); // Resolve logger with user data

    morgan(
        ':method :url - :response-time ms',
        {
            stream: {
                write: (message) => logger.http(message.trim()),
            },
        }
    )(req, res, next); // Use morgan with the created logger
};