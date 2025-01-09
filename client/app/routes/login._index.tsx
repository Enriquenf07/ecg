import type { MetaFunction } from "@remix-run/node";
import { Form, redirect, useLocation, useNavigation } from "@remix-run/react";
import { useState } from "react";
import { Input } from "~/components/ui/input";
import { createCookie, json } from "@remix-run/node";
import { useLoaderData } from "@remix-run/react";
import axios from "axios";
import { BiErrorAlt } from "react-icons/bi";

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
    sameSite: 'lax', // Adjust according to your needs
});

export const action = async ({ request }: { request: any }) => {
    const formData = new URLSearchParams(await request.text());
    const login = formData.get("login");
    const password = formData.get("password");

    try {
        console.log('logandooooo')
        const response = await axios.post('http://gateway:5000/login', { login, password });
        console.log(response)
        const token = response.data.accessToken
        if (token) {
            const cookieHeader = await jwtCookie.serialize(token);
            return redirect('/', {
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

    return (
        <div className="w-full min-h-screen flex justify-center py-12 bg-violet-300">
            <div className="bg-white py-32 p-24 rounded-xl shadow-md flex flex-col">
                <Form method="post" navigate={false} className="flex gap-4 flex-col">
                    <h1>LOGIN</h1>
                    {message && (
                        <div className="flex gap-1 items-center">
                            <BiErrorAlt className="text-red-600" />
                            <p className="text-red-600">{message}</p>
                        </div>
                    )}
                    <div className="flex flex-col gap-4">
                        <Input placeholder="Login" name="login" />
                        <Input type="password" placeholder="Senha" name="password" />
                        <button type="submit">Login</button>
                    </div>
                </Form>
            </div>
        </div>
    );
}
