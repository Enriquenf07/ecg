import { LogIn, UserPlus } from "lucide-react";
import { useMediaQuery } from "usehooks-ts";
import Layout from "~/components/egc/layout";

export default function HomePage() {
    const items = [
        {
            title: "Login",
            url: "/login",
            icon: LogIn,
        },
        {
            title: "Cadastro",
            url: "/cadastro",
            icon: UserPlus,
        },
    ]

    const smallScreen = useMediaQuery('(max-width: 768px)')

    return (
        <Layout
            className="flex-grow h-screen bg-gray-100"
            noDefaultItens
            items={items}>
            <div className="flex h-full">
                <div className="lg:w-1/2 w-full p-10 h-full bg-white justify-center items-center flex-col flex">
                    <div className="flex flex-col gap-6 w-[70%]">
                        <h1 className="text-5xl font-merriweather">Aprenda Eletrocardiograma de Forma Interativa</h1>
                        <h2 className="text-zinc-600">Ofereçemos uma grande variedade de conteúdos, incluindo aulas, artigos e testes para você continuar evoluindo.</h2>
                        <button className="bg-red-400 shadow-md hover:bg-red-500 active:bg-red-600 text-white rounded-md p-2">
                            <a href="/cadastro">Comece agora</a>
                        </button>
                    </div>
                </div>
                {
                    !smallScreen && <div className="w-1/2 p-10 border-l h-full bg-gray-100 overflow-hidden flex flex-col justify-center items-center">
                        <img src="/man-writing-calculator.jpg" className="object-scale-down w-[80%] rounded-md shadow-lg" alt="" />
                    </div>
                }
            </div>
        </Layout>
    )
}