import { ActionFunctionArgs } from "@remix-run/node";
import { Form, json, redirect, useFetcher, useLoaderData, useNavigate, useNavigation, useParams, useRevalidator, useSubmit } from "@remix-run/react";
import axios from "axios";
import { useState } from "react";
import BounceLoader from "react-spinners/BounceLoader";
import Layout from "~/components/egc/layout";
import { Button } from "~/components/ui/button";
import { jwtLoader } from "~/lib/jwt";
import { ModuloService } from "~/services/ModuloService";

export const loader = async ({ request, params }: { request: any, params: any }) => {
    const finalToken = await jwtLoader({ request })
    const { id } = params
    if (!finalToken) return null
    const response = await axios.get(`${process.env.API_HOST}/api/modulo/${id}/iniciar-teste`, {
        headers: {
            'Authorization': `Bearer ${finalToken}`,
        },
    });
    return json({ ...response.data, token: finalToken, host: process.env.API_HOST });
};

export const action = async ({ request }: ActionFunctionArgs) => {
    const finalToken = await jwtLoader({ request })
    const body = await request.formData()
    const id = body.get('id')
    const index = body.get('index')
    const key = body.get('key')
    await axios.post(`${process.env.API_HOST}/api/modulo/${id}/teste/${index}/${key}`, {}, {
        headers: {
            'Authorization': `Bearer ${finalToken}`,
        },
    });
    return null

};

export default function Index() {
    const data = useLoaderData<typeof loader>()
    const [index, setIndex] = useState(1)
    const { id } = useParams()
    const navigate = useNavigate()
    const submit = useSubmit()
    const fetcher = useFetcher();
    const { state } = useNavigation()


    return (
        <Layout>
            <div className="flex flex-col gap-4 justify-center w-full">
                <p>{data?.exercicios?.find((i: any) => i.numero == index)?.numero}. {data.exercicios.find((i: any) => i.numero == index).enunciado}</p>
                {state === 'idle' ? (
                    <>
                        <div className="flex flex-col gap-3">
                            {Object.entries(data.exercicios.find((i: any) => i.numero == index).alternativas).filter(item => item[1] != null).map(([key, value]: any) => (
                                <fetcher.Form className="w-full flex flex-col" onSubmit={(e) => {
                                    const formData = new FormData(e.currentTarget);
                                    const respostaData = { ...formData, id, index, key }
                                    submit(respostaData, { method: 'post', });
                                    e.preventDefault()
                                }}>
                                    <Button key={key} className={`${data.exercicios.find((i: any) => i.numero == index).resposta === key ? 'bg-amber-300' : 'bg-violet-300'} hover:bg-violet-600`} type="submit">{`${key}) ${value}`}</Button>
                                </fetcher.Form>

                            ))}
                        </div>
                        <div className="flex gap-3 justify-end flex-col lg:flex-row">
                            <Button onClick={() => setIndex(prev => prev <= 1 ? prev : prev - 1)}>Questão anterior</Button>
                            {index < data.exercicios.length ?
                                <Button onClick={() => setIndex(prev => prev >= data.exercicios.length ? prev : prev + 1)}>Proxima questão</Button> :
                                <fetcher.Form action="teste/concluir" method="post" onSubmit={(e) => {
                                    const formData = new FormData(e.currentTarget);
                                    const respostaData = { ...formData, id }
                                    submit(respostaData, { action: '/teste/concluir' ,method: 'post', });
                                    e.preventDefault()
                                }}>
                                    <Button className="bg-green-600 hover:bg-green-700" type='submit'>
                                        Terminar Teste
                                    </Button>
                                </fetcher.Form>
                            }
                        </div>
                    </>
                ) : (
                    <div className="w-full flex justify-center h-32 items-center">
                        <BounceLoader color="#ff7f7f" />
                    </div>
                )}
            </div>
        </Layout>
    );
}