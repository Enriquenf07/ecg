import winston from 'winston';
import cookie from 'cookie'

const { combine, timestamp, json } = winston.format;

export default async function createLogger(request: any) {
    const cookieHeader = request.headers.get("Cookie");
    const cookies = cookie.parse(cookieHeader || "");
    const login = atob(cookies.login || "");
    return winston.createLogger({
        level: 'http',
        defaultMeta: { user: login.replace(/^"|"$/g, ''), method: request.method, url: request.url },
        format: winston.format.combine(
            winston.format.timestamp({
                format: 'YYYY-MM-DD hh:mm:ss',
            }),
            winston.format.json()
        ),
        transports: [new winston.transports.Console()],
    });
}

export const log = async(request: any, message: string) => {
    const cookieHeader = request.headers.get("Cookie");
    const cookies = cookie.parse(cookieHeader || "");
    
    const login = atob(cookies.login || "");
    
}
