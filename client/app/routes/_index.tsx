import { json, type MetaFunction } from "@remix-run/node";
import { redirect, useLoaderData } from "@remix-run/react";
import axios from "axios";
import CardButton from "~/components/egc/cardButtonMenu";
import Layout from "~/components/egc/layout";
import { jwtLoader, jwtLoaderImpl } from "~/lib/jwt";
import { AulasService } from "~/services/HomeService";

// ADICIONAR ULTIMOS RESULTADOS E ENCERRAR TESTE

export const meta: MetaFunction = () => {
  return [
    { title: "EGC" },
    { name: "description", content: "EGC" },
  ];
};

export const loader = async ({ request }: { request: any }) => {
  const finalToken = await jwtLoader({ request })
  if (!finalToken) return redirect('/login')

  const response = await AulasService(finalToken).pesquisar()

  return json({ aulas: response.data, token: finalToken });
};


export default function Index() {
  const data = useLoaderData<typeof loader>()
  return (
    <Layout items={[]}>
      <div className="flex flex-col gap-6">
        <h1 className="text-3xl">Bem vindo</h1>
        <h2 className="text-zinc-400 text-2xl">Aulas</h2>
        <div className="flex gap-6">
          {data?.aulas.map((i: any) => (
            <CardButton.Aula key={i.id} item={i} href={`aula/${i.id}`}/>
          ))}
        </div>
      </div>
    </Layout>
  );
}

