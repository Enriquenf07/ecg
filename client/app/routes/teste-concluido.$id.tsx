import { json, useLoaderData, useParams, useRevalidator } from "@remix-run/react";
import { Suspense, useState } from "react";
import CardButton from "~/components/egc/cardButtonMenu";
import Layout from "~/components/egc/layout";
import { jwtLoader } from "~/lib/jwt";
import { AulasService } from "~/services/HomeService";
import { ModuloService } from "~/services/ModuloService";
import ReactPlayer from "react-player";
import dayjs from 'dayjs';
import { Button } from "~/components/ui/button";

export const loader = async ({ request, params }: { request: any, params: any }) => {
    const { id } = params
    const finalToken = await jwtLoader({ request })
    if (!finalToken) return null
    const url = new URL(request.url);
    const testeId = url.searchParams.get('teste');
    const response = await ModuloService(finalToken).carregarExercicios(id, Number(testeId))
    return json({ token: finalToken, exercicios: response.data, testeId });
};

export default function Index() {
    const data = useLoaderData<typeof loader>()

    return (
        <Layout items={[]}>
            <div className="flex flex-col gap-4">
                <h2 className="text-2xl">Teste {data?.testeId}</h2>
                {data?.exercicios?.map((item: any) => (
                    <div className={`border p-4 flex rounded-md flex-col w-full ${item.resposta === item.respostaCerta ? 'bg-green-200' : "bg-red-200"}`}>
                        <h1 className="text-2xl font-bold">{`${item.numero}. ${item.enunciado}`}</h1>
                        <p className="font-bold">Sua resposta: </p>
                        <p>{item.resposta ? `${item.resposta}) ${item.respostaDescricao}` : "Sem resposta"} </p>
                        <p className="font-bold">Resposta correta: </p>
                        <p>{`${item.respostaCerta}) ${item.respostaCertaDescricao}`}</p>
                    </div>
                ))}
            </div>
        </Layout>
    );
}