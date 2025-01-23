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
import { LoaderFunctionArgs } from "@remix-run/node";

export const loader = async ({ request, params }: LoaderFunctionArgs) => {
    const { id } = params
    const finalToken = await jwtLoader({ request })
    if (!finalToken) return null

    const response = await ModuloService(finalToken).carregar(id)
    const resultadoResponse = await ModuloService(finalToken).resultados(id)
    return json({ modulo: response.data, token: finalToken, resultados: resultadoResponse.data.content });
};

export default function Index() {
    const data = useLoaderData<typeof loader>()
    const { id } = useParams()
    return (
        <Layout items={[]}>
            <div className="flex flex-col gap-4">
                <h1 className="text-3xl">{data?.modulo?.descricao.toUpperCase()}</h1>
                <h2 className="text-2xl text-zinc-400">Últimos resultados</h2>
                {data?.resultados?.map((item: any) => (
                    <a href={`/teste-concluido/${id}?teste=${item.id}`} className="w-full">
                        <button className="border p-4 flex flex-col w-full rounded-md bg-slate-200">
                            <p><span className="text-xl font-bold">ID:</span> {item.id}</p>
                            <p><span className="text-xl font-bold">Início:</span> {dayjs(item.dataHora).format("DD/MM/YYYY - HH:mm")}</p>
                            {
                                item.horaEncerramento && (
                                    <p><span className="text-xl font-bold">Término:</span> {dayjs(item.horaEncerramento).format("DD/MM/YYYY - HH:mm")}</p>
                                )
                            }
                            <p><span className="text-xl font-bold">Número de acertos:</span> {item.acertadas}</p>
                        </button>
                    </a>
                ))}
            </div>
        </Layout >
    );
}