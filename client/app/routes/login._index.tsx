import type { MetaFunction } from "@remix-run/node";
import { Form, redirect, useActionData, useFetcher, useLocation, useNavigation } from "@remix-run/react";
import { useState } from "react";
import { Input } from "~/components/ui/input";
import { createCookie, json } from "@remix-run/node";
import { useLoaderData } from "@remix-run/react";
import axios from "axios";
import { BiErrorAlt } from "react-icons/bi";
import BounceLoader from "react-spinners/BounceLoader";

export const meta: MetaFunction = () => {
    return [
        { title: "Login" },
        { name: "description", content: "Welcome to Remix!" },
    ];
};

interface Form {
    login: string | null,
    password: string | null
}

const initialForm = {
    login: null,
    password: null
}

export async function loader({ request }: { request: any }) {
    const cookieHeader = request.headers.get('Cookie');
    const cookie = await jwtCookie.parse(cookieHeader);
    return json({ token: cookie });
}

const jwtCookie = createCookie('jwt', {
    httpOnly: true,
    path: '/',
    sameSite: 'lax',
});

export const action = async ({ request }: { request: any }) => {
    const formData = new URLSearchParams(await request.text());
    const login = formData.get("login");
    const password = formData.get("password");

    try {
        console.log(`${process.env.API_HOST}/login`, { login, password })
        const response = await axios.post(`${process.env.API_HOST}/login`, { login, password });
        const token = response.data.accessToken
        if (token) {
            const cookieHeader = await jwtCookie.serialize(token);
            return redirect('/app', {
                headers: {
                    "Set-Cookie": cookieHeader,
                },
            });
        }

        return redirect('/login?message=Login ou senha inválidos');
    } catch (e) {
        console.log('erro ao efetuar chamada na api')
        return redirect('/login?message=Login ou senha inválidos');
    }
};

export default function Index() {
    const { search } = useLocation();
    const params = new URLSearchParams(search);
    const message = params.get('message');
    const fetcher = useFetcher();

    return (
        <div className="w-full min-h-screen flex justify-center py-12 bg-red-300">
            {fetcher.state != 'idle'
                ? (
                    <div className="flex items-center">
                        <BounceLoader />
                    </div>
                )
                : (<div className="bg-white py-32 p-6 w-[90%] lg:w-1/3 rounded-xl shadow-md flex flex-col">
                    <fetcher.Form method="post" className="flex gap-4 flex-col">
                        <h1 className="text-center text-xl">ECG</h1>
                        {message && (
                            <div className="flex gap-1 items-center">
                                <BiErrorAlt className="text-red-600" />
                                <p className="text-red-600">{message}</p>
                            </div>
                        )}
                        <div className="flex flex-col gap-4">
                            <Input className="text-md py-5" placeholder="Login" name="login" />
                            <Input className="text-md py-5" type="password" placeholder="Senha" name="password" />
                            <button className="border rounded-md p-2 bg-zinc-800 hover:bg-zinc-600 text-white" type="submit">LOGIN</button>
                            <button className="border rounded-md p-2 bg-zinc-800 hover:bg-zinc-600 text-white">CRIAR CONTA</button>
                        </div>
                    </fetcher.Form>
                </div>
                )}

        </div>
    );
}
