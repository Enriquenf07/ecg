import { json, redirect, useFetcher, useLoaderData, useRevalidator } from "@remix-run/react";
import axios from "axios";
import { useState } from "react";
import { Button } from "~/components/ui/button";
import { jwtLoader } from "~/lib/jwt";

export const loader = async ({ request }: { request: any }) => {
    const finalToken = await jwtLoader({ request })
    console.log(finalToken)
    if (!finalToken) return null
    const response = await axios.get('http://localhost:5000/api/modulo/1/iniciar-teste', {
        headers: {
            'Authorization': `Bearer ${finalToken}`,
        },
    });
    console.log(finalToken)
    return json({ ...response.data, token: finalToken });
};

export default function Index() {
    const data = useLoaderData<typeof loader>()
    const [index, setIndex] = useState(1)
    const revalidator = useRevalidator();


    return (
        <div className="w-full min-h-screen flex justify-center bg-violet-300">
            <div className="bg-white py-32 p-24 rounded-xl shadow-md flex flex-col w-screen">
                <div className="flex flex-col gap-4">
                    <p>1.{data.exercicios.find((i: any) => i.numero == index).enunciado}</p>
                    <div className="flex flex-col gap-3">
                        {Object.entries(data.exercicios.find((i: any) => i.numero == index).alternativas).map(([key, value]: any) => (
                            <Button className={`${data.exercicios.find((i: any) => i.numero == index).resposta === key ? 'bg-amber-300' : 'bg-violet-300'} hover:bg-violet-600`} onClick={async () => {
                                await axios.post(`http://localhost:5000/api/modulo/1/teste/${index}/${key}`, {}, {
                                    headers: {
                                        'Authorization': `Bearer ${data.token}`,
                                    },
                                });
                                revalidator.revalidate()
                            }}>{`${key}) ${value}`}</Button>
                        ))}
                    </div>
                    <div className="flex gap-3 justify-end">
                        <Button onClick={() => setIndex(prev => prev <= 1? prev : prev - 1)}>Questão anterior</Button>
                        <Button onClick={() => setIndex(prev => prev >= data.exercicios.length ? prev : prev + 1)}>Proxima questão</Button>
                    </div>
                </div>
            </div>
        </div>
    );
}