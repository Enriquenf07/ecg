import { json, useLoaderData, useParams, useRevalidator } from "@remix-run/react";
import { Suspense, useState } from "react";
import CardButton from "~/components/egc/cardButtonMenu";
import Layout from "~/components/egc/layout";
import { jwtLoader } from "~/lib/jwt";
import { AulasService } from "~/services/HomeService";
import { ModuloService } from "~/services/ModuloService";
import ReactPlayer from "react-player";
import { Activity, Home } from "lucide-react";

export const loader = async ({ request, params }: { request: any, params: any }) => {
    const { id } = params
    const finalToken = await jwtLoader({ request })
    if (!finalToken) return null

    const response = await ModuloService(finalToken).carregar(id)
    return json({ modulo: response.data, token: finalToken });
};

export default function Index() {
    const data = useLoaderData<typeof loader>()
    const { id } = useParams()
    

    return (
        <Layout items={[
            {
                title: "Resultados",
                url: `/resultado/${id}`,
                icon: Activity,
            },
        ]}>
            <div className="flex flex-col gap-6">
                <h1 className="text-3xl">{data?.modulo?.descricao.toUpperCase()}</h1>
                <div className="w-full flex justify-center">
                    <Suspense fallback="Loding..">
                        <ReactPlayer
                            width={'100%'}
                            height={'100%'}
                            controls={true}
                            url={"https://storage.cloud.google.com/ecg-umc/modulo_1.mp4"}
                            config={{
                                file: {
                                    tracks: [
                                        { label: "English", kind: 'subtitles', src: 'https://storage.cloud.google.com/ecg-umc/sample.vtt', srcLang: 'en', default: true }
                                    ]
                                }
                            }}
                        />
                    </Suspense>
                </div>
                <a href={`../teste/${id}`}>
                    <button className="bg-green-500 p-2 rounded-md hover:bg-green-600 w-full">
                        Iniciar teste
                    </button>
                </a>
            </div>
        </Layout>
    );
}