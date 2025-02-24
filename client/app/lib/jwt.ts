
import { LoaderFunctionArgs, TypedResponse } from "@remix-run/node";
import { redirect } from "@remix-run/react";
import axios from "axios";
import cookie from 'cookie'
import createLogger from "./logger";

export const logDefault = async(request: any) => {
    const logger = await createLogger(request);
    logger.info(`ping`)
    
}

export const jwtLoader = async ({ request }: any) => {
    const cookieHeader = request.headers.get("Cookie");
    await logDefault(request)
    const cookies = cookie.parse(cookieHeader || "");
    
    const encodedToken = cookies.jwt || ""
    const token = Buffer.from(encodedToken, 'base64').toString('utf8')
    const finalToken = token.replace(/"/g, '').trim()
    if (!cookies.jwt) {
        return null
    }
    try {
        const response = await axios.get(`${process.env.API_HOST}/validateToken`, {
            headers: {
                'Authorization': `Bearer ${finalToken}`,
            },
        });
    } catch (error) {
        return redirect('/')
    }
    return finalToken
};


export const jwtLoaderImpl = async ({ request }: { request: any }) => {
    const finalToken = await jwtLoader({ request })
    if (!finalToken) return redirect('/login')
    return null
};