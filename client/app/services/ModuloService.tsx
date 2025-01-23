import axios from "axios";

export const ModuloService = (token?: string) => {
    
    const carregar = async (id: number) => {
        const response = await axios.get(`${process.env.API_HOST}/api/modulo/${id}`, {
            headers: {
                'Authorization': `Bearer ${token}`,
            },
        });

        return response
    }

    

    const carregarVideo = async (id: number) => {
        const response = await axios.get(`${process.env.API_HOST}/api/video/${id}`, {
            headers: {
                'Authorization': `Bearer ${token}`,
            },
            responseType: 'arraybuffer', 
        });
    
        return response
    }

    const resultados = async (id: number) => {
        const response = await axios.get(`${process.env.API_HOST}/api/modulo/${id}/resultado`, {
            headers: {
                'Authorization': `Bearer ${token}`,
            },
        });

        return response
    }

    const encerrarTeste = async (id: number) => {
        const response = await axios.post(`${process.env.API_HOST}/api/modulo/${id}/encerrar-teste`, {}, {
            headers: {
                'Authorization': `Bearer ${token}`,
            },
        });

        return response
    }

    const carregarExercicios = async (id: number, teste: number) => {
        const response = await axios.get(`${process.env.API_HOST}/api/modulo/${id}/resultado/${teste}`, {
            headers: {
                'Authorization': `Bearer ${token}`,
            },
        });

        return response
    }



    return {
        carregar,
        carregarVideo,
        resultados,
        encerrarTeste,
        carregarExercicios
    }
};