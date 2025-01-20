import axios from "axios";
import Cadastro from "~/pages/Cadastro";
import { jwtCookie } from "./login._index";
import { redirect } from "@remix-run/react";

export const action = async ({ request }: { request: any }) => {
    const formData = new URLSearchParams(await request.text());
    const login = formData.get("login");
    const password = formData.get("password");
    const email = formData.get('email')

    try {
        const responseCadastro = await axios.post(`${process.env.API_HOST}/cadastro`, { login, email,password })
        return redirect('/');
    } catch (e) {
        console.log('erro ao efetuar chamada na api')
        return redirect('/cadastro?message=Erro ao efetuar o cadastro');
    }
};

export default function index() {
    return (
        <Cadastro />
    )
}