import { ReactNode } from "react"
import { Progress } from "../ui/progress";
import { Home, LockKeyhole, LockKeyholeOpen } from "lucide-react";

function DefaultRoot({ children, href }: { children?: ReactNode, href?: string }) {
    return (
        <a href={href}>
            <div className="border w-[30rem] h-[15rem] border-l-8 border-l-blue-400 p-5 pb-12 flex flex-col justify-between rounded-3xl bg-amber-100">
                {children}
            </div>
        </a>
    )
}

function Root({ children, className, href, disabled }: { children?: ReactNode, className?: string, href?: string, disabled?: boolean }) {
    return (
        <a
            href={disabled ? undefined : href}
            onClick={(e) => {
                if (disabled) e.preventDefault();
            }}
        >
            <div className={`border w-[17rem] h-[15rem] border-l-8  p-5 pb-12 flex flex-col justify-start ${disabled ? 'opacity-50 cursor-not-allowed' : ''}  ${className}`}>
                {children}
            </div>
        </a>
    )
}

function Aula({ item, ...rest }: { item: { descricao: string, modulosConcluidos: number, modulosTotais: number }, [key: string]: any }) {
    const normalise = ((item.modulosConcluidos) * 100) / (item.modulosTotais);
    return (
        <DefaultRoot {...rest}>
            <h1>{item.descricao.toUpperCase()}</h1>
            <div className="flex flex-col gap-2">
                <h1 className="text-nowrap">Modulos concluidos: {item.modulosConcluidos}/{item.modulosTotais}</h1>
                <Progress value={normalise} />
            </div>
        </DefaultRoot>
    )
}

function Modulo({ item, ...rest }: { item: { descricao: string, concluido: boolean, numero: number, desbloqueado: boolean }, [key: string]: any }) {
    return (
        <Root disabled={!item.desbloqueado} className={item.concluido ? "border-l-green-400 " : ""} {...rest}>
            <h1>{item.numero + ` - ` + item.descricao.toUpperCase()}</h1>
            <div className="w-full flex justify-center grow items-center">
                {item.desbloqueado ? <LockKeyholeOpen /> : <LockKeyhole />}
            </div>
        </Root>
    )
}

function Menu({ children, href }: { children?: ReactNode, href?: string }) {
    return (
        <a href={href}>
            <div className="border w-[40rem]  border-l-8 border-l-blue-400 p-5 pb-12 flex flex-col justify-between">
                {children}
            </div>
        </a>
    )
}

const CardButton = { Root, Aula, Modulo, Menu }

export default CardButton