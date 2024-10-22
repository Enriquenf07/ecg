import type { MetaFunction } from "@remix-run/node";
import { jwtLoader, jwtLoaderImpl } from "~/lib/jwt";

export const meta: MetaFunction = () => {
  return [
    { title: "New Remix App" },
    { name: "description", content: "Welcome to Remix!" },
  ];
};

export const loader = jwtLoaderImpl;

export default function Index() {
  return (
    <>
    <button>Modulo 1</button>
    <button>Modulo 2</button>
    <button>Modulo 3</button>
    <button>Modulo 4</button>
    </>
  );
}
