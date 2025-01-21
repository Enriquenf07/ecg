import pino from "pino";

export default pino({
    level: 'info',
    timestamp: pino.stdTimeFunctions.isoTime,
    formatters: {
        log: (obj: any) => {
            if (obj.req) {
                const { req, res } = obj;
                return {
                    method: req.method,
                    url: req.url,
                    status: res.statusCode,
                    userAgent: req.headers['user-agent'],
                    contentLength: res.headers['content-length'] || 0,
                };
            }
            return obj;
        },
    },
});