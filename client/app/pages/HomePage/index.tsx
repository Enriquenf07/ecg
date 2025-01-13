import { LogIn, UserPlus } from "lucide-react";
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
            url: "/cadastrar",
            icon: UserPlus,
        },
    ]

    return (
        <Layout
            noDefaultItens
            items={items}>
            oiii
        </Layout>
    )
}