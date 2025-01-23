import { json, useLoaderData, useRevalidator } from "@remix-run/react";
import { useState } from "react";
import CardButton from "~/components/egc/cardButtonMenu";
import Layout from "~/components/egc/layout";
import { jwtLoader } from "~/lib/jwt";
import { AulasService } from "~/services/HomeService";

export const loader = async ({ request, params }: { request: any, params: any }) => {
    const { id } = params
    const finalToken = await jwtLoader({ request })
    if (!finalToken) return null

    const response = await AulasService(finalToken).pesquisarModulos(id)
    const info = await AulasService(finalToken).carregar(id)
    return json({ modulos: response.data, token: finalToken, info: info.data });
};

export default function Index() {
    const data = useLoaderData<typeof loader>()

    return (
        <Layout items={[]}>
            <div className="flex flex-col gap-6">
                <h1 className="text-3xl">{data?.info?.descricao.toUpperCase()}</h1>
                <h2 className="text-zinc-400 text-2xl">Aulas</h2>
                <div className="flex gap-6 flex-wrap">
                    {data?.modulos.map((i: any) => (
                        <CardButton.Modulo key={i.id} item={i} href={`../modulo/${i.id}`} />
                    ))}
                </div>
            </div>
        </Layout>
    );
}