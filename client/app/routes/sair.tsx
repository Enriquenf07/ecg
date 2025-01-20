import { redirect } from "@remix-run/react";
import { jwtCookie } from "./login._index";

export async function loader({ request }: { request: any }) {
    const cookieHeader = await jwtCookie.serialize(null);
    return redirect('/', {
        headers: {
            "Set-Cookie": cookieHeader,
        },
    });
}