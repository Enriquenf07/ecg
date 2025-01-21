import { ActionFunctionArgs, redirect } from "@remix-run/node";
import axios from "axios";
import { jwtLoader } from "~/lib/jwt";
import { ModuloService } from "~/services/ModuloService";

export const action = async ({ request }: ActionFunctionArgs) => {
    const finalToken = await jwtLoader({ request })
    const body = await request.formData()
    const id = body.get('id')
    try{
        if (id) {
            await ModuloService(finalToken).encerrarTeste(Number(id))
        }
    }catch(e){
        return null
    }
    return redirect(`../resultado/${id}`)

};
