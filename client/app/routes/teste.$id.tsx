import { json, redirect, useFetcher, useLoaderData, useNavigate, useNavigation, useParams, useRevalidator } from "@remix-run/react";
import axios from "axios";
import { useState } from "react";
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
    return json({ ...response.data, token: finalToken });
};

export default function Index() {
    const data = useLoaderData<typeof loader>()
    const [index, setIndex] = useState(1)
    const revalidator = useRevalidator();
    const {id} = useParams()
    const navigate = useNavigate()

    return (
        <Layout>
            <div className="flex flex-col gap-4 justify-center w-full">
                <p>{data?.exercicios?.find((i: any) => i.numero == index)?.numero}. {data.exercicios.find((i: any) => i.numero == index).enunciado}</p>
                <div className="flex flex-col gap-3">
                    {Object.entries(data.exercicios.find((i: any) => i.numero == index).alternativas).filter(item => item[1] != null).map(([key, value]: any) => (
                        <Button className={`${data.exercicios.find((i: any) => i.numero == index).resposta === key ? 'bg-amber-300' : 'bg-violet-300'} hover:bg-violet-600`} onClick={async () => {
                            await axios.post(`${process.env.API_HOST}/api/modulo/${id}/teste/${index}/${key}`, {}, {
                                headers: {
                                    'Authorization': `Bearer ${data.token}`,
                                },
                            });
                            revalidator.revalidate()
                        }}>{`${key}) ${value}`}</Button>
                    ))}
                </div>
                <div className="flex gap-3 justify-end flex-col lg:flex-row">
                    <Button onClick={() => setIndex(prev => prev <= 1 ? prev : prev - 1)}>Questão anterior</Button>
                    {index < data.exercicios.length ?
                        <Button onClick={() => setIndex(prev => prev >= data.exercicios.length ? prev : prev + 1)}>Proxima questão</Button> :
                        <Button className="bg-green-600 hover:bg-green-700" onClick={async () => {
                            if(id){
                                await ModuloService(data.token).encerrarTeste(Number(id))
                            }
                            navigate(`../resultado/${id}`)
                        }}>
                            Terminar Teste
                        </Button>
                    }
                </div>
            </div>
        </Layout>
    );
}