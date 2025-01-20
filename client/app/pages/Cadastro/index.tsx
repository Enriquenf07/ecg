import { useFetcher } from "@remix-run/react";
import BounceLoader from "react-spinners/BounceLoader";
import { Input } from "~/components/ui/input";

export default function Cadastro({ }) {
    const fetcher = useFetcher();
    return (
        <div className="w-full min-h-screen flex justify-center py-12 bg-red-300">
            {fetcher.state != 'idle'
                ? (
                    <div className="flex items-center">
                        <BounceLoader />
                    </div>
                )
                : (<div className="bg-white py-32 p-6 w-[90%] lg:w-1/3 rounded-xl shadow-md flex flex-col">
                    <fetcher.Form method="post" className="flex gap-4 flex-col">
                        <h1 className="text-center text-xl">ECG</h1>
                        <div className="flex flex-col gap-4">
                            <Input className="text-md py-5" placeholder="Login" name="login" />
                            <Input className="text-md py-5" placeholder="Email" name="email" />
                            <Input className="text-md py-5" type="password" placeholder="Senha" name="password" />
                            <button className="active:bg-zinc-400 rounded-md p-2 transition duration-150 ease-in-out bg-zinc-800 text-white" type="submit">FINALIZAR CADASTRO</button>
                            <button className="active:bg-zinc-200 rounded-md p-2 transition duration-150 ease-in-out" type="button">
                                <a href="/login">Já possui uma conta? Faça o login.</a>
                            </button>
                        </div>
                    </fetcher.Form>
                </div>
                )}

        </div>
    )
}