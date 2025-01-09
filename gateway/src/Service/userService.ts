import { compare, hash } from "bcryptjs"
import { Request, Response } from "express"
import { knex } from "../sqlConfig"
import { sign } from "jsonwebtoken"

interface IUserLogin {
    userReq: string
    passwordReq: string
}

interface IUser {
    id: string
    login: string
    senha: string
}

interface IUserCadastro {
    email: string
    login: string
    senha: string
}

export const login = async ({ userReq, passwordReq }: IUserLogin) => {
    console.log(userReq)
    const { id, login: user, senha: password }: IUser = await knex.select('*').from('usuario').where('login', userReq).first()
    const isPasswordEqual = await compare(passwordReq, password)
    console.log(isPasswordEqual)
    if (!isPasswordEqual) {
        throw new Error('senha invalida')
    }
    console.log(id)
    const secret = process.env.JWT_SECRET
    if (!secret) {
        console.log('oiii')
        throw new Error('Bad Request')

    }
    try {
        const token = sign(
            { user: user, },
            secret,
            {
                subject: id.toString(), expiresIn: "1d",
            }
        );
        return { accessToken: token }
    } catch (e) {
        console.log(e)
    }
}

export const cadastro = async (cadastro: IUserCadastro) => {
    await knex.transaction(async (trx) => {
        const senhaHash = await hash(cadastro.senha, 12)
        const usuario:{id: number}[] = (await trx('usuario').returning('id').insert({ ...cadastro, senha: senhaHash }))
        const modulos = await trx('modulo').select('id')
        const modulosF = await Promise.all(modulos.map(async (modulo) => ({ modulo: modulo.id, usuario: usuario[0].id, concluido: false })))
        console.log(modulosF)
        await trx('modulo_usuario').returning('id').insert(modulosF)
    })

}